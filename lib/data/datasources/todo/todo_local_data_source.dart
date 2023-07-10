import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app_clean_code/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import '../../models/todo/todo_model.dart';
import '../../../domain/entities/todo/todo.dart';

abstract class TodoLocalDataSource {
  ///Throws [FirebaseException] if no data found
  Future<TodoModel> getTodo(int id);

  Future<List<TodoModel>> getAllTodo();

  Future<Todo> addTodo(String task);
  Future<void> getDeleteTodo(String id);
}

@LazySingleton(as: TodoLocalDataSource)
class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  TodoLocalDataSourceImpl();

  // This is a dummy in memory data source to mock a local database
  List<TodoModel> todoModelList = [
    TodoModel(
        task:
            'This is a very long to be done by me! I have to develop ViewTodoPage and edit todo page. Then i have to develop delete todo function. This is a very long to be done by me! I have develop view todo page and edit todo page. then i have tp develop delete todo function',
        id: '0'),
    TodoModel(task: 'task2', id: '1'),
    TodoModel(task: 'task3', id: '2'),
    TodoModel(task: 'task4', id: '3')
  ];

  @override
  Future<TodoModel> getTodo(int id) {
    final TodoModel todoModel = TodoModel(task: 'task2', id: '1');
    // todoModelList.firstWhere((element) => element.id == id.toString());
    // ignore: unnecessary_null_comparison
    if (todoModel != null) {
      return Future.delayed(const Duration(seconds: 1), () => todoModel);
    } else {
      throw const FirebaseFailure();
    }
    // return Future.value(TodoModel.fromJson({}));
  }

  @override
  Future<List<TodoModel>> getAllTodo() {
    // throw FirebaseException();
    return Future.delayed(const Duration(seconds: 1), () => todoModelList);
  }

  @override
  Future<Todo> addTodo(String task) {
    throw const FirebaseFailure();
    // return Future.delayed(const Duration(seconds: 1), () {
    //   final todo = TodoModel(task: task, id: todoModelList.length);
    //   todoModelList.add(todo);
    //   return todo;
    // });
  }

  @override
  Future<void> getDeleteTodo(String id) {
    return Future.delayed(const Duration(seconds: 1), () {
      return;
    });
  }
}
