import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/core/usecases/usecase.dart';
import 'package:flutter_todo_app_clean_code/domain/entities/todo/todo.dart';
import 'package:flutter_todo_app_clean_code/domain/repositories/todo/todo_repository.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/get_all_todo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../data/mock_data.dart';
import 'add_todo_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late MockTodoRepository mockTodoRepository;
  late GetAllTodo getAllTodo;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    getAllTodo = GetAllTodo(mockTodoRepository);
  });

  test("should get all todo from the repository", () async {
    // arrange
    when(mockTodoRepository.getAllTodo())
        .thenAnswer((_) async => Right(allTodoModel));
    // act
    final result = await getAllTodo(NoParams());
    // assert
    expect(result, Right(allTodoModel));
    verify(mockTodoRepository.getAllTodo());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
