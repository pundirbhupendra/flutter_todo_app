import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/data/models/todo/todo_model.dart';

void main() {
  group('get task title', () {
    test('return the task of todo', () {
      final TodoModel todoModel = TodoModel(task: 'aqweas');

      final result = todoModel.task;

      expect(result, equals('aqweas'));
    });
  });
}
