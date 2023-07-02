import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_local_data_source.dart';
import 'package:flutter_todo_app_clean_code/data/datasources/todo/todo_remote_data_source.dart';
import 'package:flutter_todo_app_clean_code/data/models/todo/todo_model.dart';
import 'package:mockito/mockito.dart';
//flutter test test/counter_test.dart
//flutter test test/data/datasource/todo/todo_remote_data_source_test.dart

// @GenerateMocks([
//   FirebaseService,
//   SmsService,
// ])
void main() {
  // late TodoRemoteDataSourceImpl todoRemoteDataSourceImpl;
  late TodoLocalDataSourceImpl todoLocalDataSourceImpl;
  setUp(() {
    //  todoRemoteDataSourceImpl = TodoRemoteDataSourceImpl();
    todoLocalDataSourceImpl = TodoLocalDataSourceImpl();
  });

  group('get todo', () {
    test('should return todo when there exists with the given id', () async {
      const String tId = '1'; //'CYeyQYbbBgoFAsPaScuJ';
      final TodoModel todoModel = TodoModel(task: 'task2', id: tId);
      // act
      final result = await todoLocalDataSourceImpl.getTodo(int.parse(tId));
      // assert
      expect(result.id, todoModel.id);
    });
  });
}
