import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/core/error/failures.dart';
import 'package:flutter_todo_app_clean_code/core/network/network_info.dart';
import 'package:flutter_todo_app_clean_code/core/usecases/usecase.dart';
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_local_data_source.dart';
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_remote_data_source.dart';
import 'package:flutter_todo_app_clean_code/data/models/todo/todo_model.dart';
import 'package:flutter_todo_app_clean_code/data/respositories/todo/todo_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mock_data.dart';
import 'todo_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NetworkInfo>(),
  MockSpec<TodoRemoteDataSource>(),
  MockSpec<TodoLocalDataSource>(),
  MockSpec<FirebaseException>()
])
void main() {
  late MockTodoRemoteDataSource mockTodoRemoteDataSource;
  late MockTodoLocalDataSource mockTodoLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MockFirebaseException mockFirebaseException;
  late TodoRepositoryImpl todoRepositoryImpl;
  setUp(() {
    mockTodoRemoteDataSource = MockTodoRemoteDataSource();
    mockTodoLocalDataSource = MockTodoLocalDataSource();
    mockFirebaseException = MockFirebaseException();
    mockNetworkInfo = MockNetworkInfo();
    todoRepositoryImpl = TodoRepositoryImpl(
        remoteDataSource: mockTodoRemoteDataSource,
        todoLocalDataSource: mockTodoLocalDataSource,
        networkInfo: mockNetworkInfo);
  });
  tearDown(() {});
  group('get All todo', () {
    test('should return list of todo ', () async {
      when(mockTodoLocalDataSource.getAllTodo())
          .thenAnswer((realInvocation) async => allTodoModel);

      final result = await todoRepositoryImpl.getAllTodo();

      expect(result, equals(Right(allTodoModel)));
    });

    test("should return Database failure when call to database is unsuccessful",
        () async {
      when(mockTodoLocalDataSource.getAllTodo())
          .thenThrow(mockFirebaseException);
      verifyNever(mockTodoLocalDataSource.getAllTodo());
      final result = await todoRepositoryImpl.getAllTodo();

      verify(mockTodoLocalDataSource.getAllTodo());
      expect(result, const Left(FirebaseFailure()));
    });

    test(
        "should return remote db failure when call to database is unsuccessful",
        () async {
      when(todoRepositoryImpl.getAllTodo()).thenThrow(mockFirebaseException);
      verifyNever(todoRepositoryImpl.getAllTodo());
      final result = await todoRepositoryImpl.getAllTodo();

      verify(todoRepositoryImpl.getAllTodo());
      expect(result, const Left(FirebaseFailure()));
    });

    test("delete todo", () async {
      when(mockTodoRemoteDataSource.deleteTodo(any))
          .thenAnswer((_) async => isNotNull);
      final result = await todoRepositoryImpl.getDeleteTodo('');
      expect(result, equals(isNotNull));
    });
  });
}
