import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../models/todo/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<TodoModel> getTodo(int id);

  Future<List<TodoModel>> getAllTodo();

  Future<void> addTodo(String task);
  Future<void> deleteTodo(String id);
}

@Injectable(as: TodoRemoteDataSource)
class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  //late final Dio dio;
  //late final FirebaseFirestore _firebaseFireStore;
  late final FirebaseService firebaseService;

//  final FirebaseAuth _firebaseAuth;
  TodoRemoteDataSourceImpl(this.firebaseService) {
    //  firebaseService = firebaseService;
    //  dio = getIt<Dio>();
    //  _firebaseFireStore = firebaseFireStore ?? getIt<FirebaseFirestore>();
  }

  @override
  Future<void> addTodo(String task) async {
    try {
      return firebaseService.addTodo(task);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<TodoModel>> getAllTodo() async {
    try {
      return await firebaseService.getAllTodo();
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
    try {
      return firebaseService.deleteTodo(id);
    } catch (_) {
      rethrow;
    }
  }
}

@injectable
class FirebaseService {
  final FirebaseFirestore _firebaseFireStore;

  FirebaseService(this._firebaseFireStore);

  Future<void> addTodo(String task) async {
    final ref = _firebaseFireStore.collection('todo').doc();

    try {
      ref.set({'task': task, 'id': ref.id}).catchError((e) => throw e);
    } catch (_) {
      rethrow;
    }
  }

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
