import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/domain/repositories/todo/todo_repository.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/add_todo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'add_todo_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late MockTodoRepository mockTodoRepository;
  late AddTodo addTodo;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    addTodo = AddTodo(mockTodoRepository);
  });

  test("should add todo to the repository", () async {
    // arrange
    when(mockTodoRepository.addTodo(any))
        .thenAnswer((realInvocation) async => const Right(isNotNull));
    // act
    final result =
        await addTodo(const Params(task: "my new task", desc: 'desc'));
    // assert
    expect(result, equals(const Right(isNotNull)));
  });
}
