import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_todo_app_clean_code/domain/entities/todo/todo.dart';
import 'package:injectable/injectable.dart';
import '../../../injection_container.dart';
import '../../models/todo/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<TodoModel> getTodo(int id);

  Future<List<TodoModel>> getAllTodo();

  Future<Todos> addTodo(String task);
  Future<void> deleteTodo(String id);
}

@Injectable(as: TodoRemoteDataSource)
class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  late final Dio dio;
  late final FirebaseFirestore _firebaseFireStore;

//  final FirebaseAuth _firebaseAuth;
  TodoRemoteDataSourceImpl() {
    // dio = getIt<Dio>();
    _firebaseFireStore = getIt<FirebaseFirestore>();
  }

  @override
  Future<Todos> addTodo(String task) async {
    final ref = _firebaseFireStore.collection('todo').doc();

    try {
      ref.set({'task': task, 'id': ref.id}).catchError((e) => throw e);
      return TodosData.fromJson({});
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<TodoModel>> getAllTodo() async {
    try {
      final ref = _firebaseFireStore.collection('todo');
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await ref.get().catchError((e) => throw e);
      // Get data from docs and convert map to List
      final allData = querySnapshot.docs
          .map((doc) => TodoModel.fromJson(
                doc.data(),
              ))
          .toList();
      return allData;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TodoModel> getTodo(int id) {
    return Future.value(TodoModel.fromJson({}));
  }

  @override
  Future<void> deleteTodo(String id) async {
    final ref = _firebaseFireStore.collection('todo');

    try {
      ref
          .doc(id)
          .delete()
          .then((value) => print("Delete"))
          .catchError((e) => throw e);
    } catch (_) {
      rethrow;
    }
  }
}
