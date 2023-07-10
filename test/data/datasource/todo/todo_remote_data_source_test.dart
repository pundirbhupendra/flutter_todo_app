import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_local_data_source.dart';
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_remote_data_source.dart';
import 'package:flutter_todo_app_clean_code/data/models/todo/todo_model.dart';
import 'package:flutter_todo_app_clean_code/injection_container.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_remote_data_source_test.mocks.dart';
//flutter test test/counter_test.dart
//flutter test test/data/datasource/todo/todo_remote_data_source_test.dart

@GenerateMocks([FirebaseService])
void main() {
  late TodoRemoteDataSourceImpl todoRemoteDataSourceImpl;
  //late TodoLocalDataSourceImpl todoLocalDataSourceImpl;
  late MockFirebaseService firebaseService;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    firebaseService = MockFirebaseService();
    todoRemoteDataSourceImpl = TodoRemoteDataSourceImpl(firebaseService);
    // todoLocalDataSourceImpl = TodoLocalDataSourceImpl();
  });

  group('get todo', () {
    test('should return todo when there exists with the given id', () async {
      final List<TodoModel> dkkd = [];
      const String tId = 'CYeyQYbbBgoFAsPaScuJ';
      final TodoModel todoModel = TodoModel(task: 'aqweas', id: tId);
      dkkd.add(todoModel);
      when(todoRemoteDataSourceImpl.getAllTodo())
          .thenAnswer((realInvocation) async => dkkd);
      verifyNever(firebaseService.getAllTodo());
      final data = await todoRemoteDataSourceImpl.getAllTodo();
      //  verifyNever(firebaseService.fetchUserDetails());
      //  verify(todoRemoteDataSourceImpl.getAllTodo());
      // act
      //   final result = await todoRemoteDataSourceImpl.getAllTodo();
      // assert
      expect(data.first.task, dkkd.first.task);
    });
  });
}
