import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/core/error/failures.dart';
import 'package:flutter_todo_app_clean_code/core/usecases/usecase.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/delete_todo.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/get_all_todo.dart';
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo/todo_cubit.dart';
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo_form/todo_form_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../data/mock_data.dart';
import 'todo_bloc_test.mocks.dart';

@GenerateMocks([GetAllTodo, DeleteTodo])
void main() {
  late TodoCubit todoCubit;
  late MockGetAllTodo mockGetAllTodo;
  late MockDeleteTodo mockDeleteTodo;
  setUp(() {
    mockGetAllTodo = MockGetAllTodo();
    mockDeleteTodo = MockDeleteTodo();
    todoCubit =
        TodoCubit(getAllTodo: mockGetAllTodo, deleteTodo: mockDeleteTodo);
  });
  test('todo initial state', () {
    expect(todoCubit.state, const TodoState());
  });

  group("Todod functions calls", () {});

  test(
    'initial state is correct',
    () {
      // ARRANGE
      final todoCubit =
          TodoCubit(getAllTodo: mockGetAllTodo, deleteTodo: mockDeleteTodo);
      // ASSERT
      expect(todoCubit.state.status, ApiStatus.initial);
    },
  );
  group('get todo list', () {
    test(
      'should get todo from the getAllTodo use case',
      () async {
        // arrange
        when(mockGetAllTodo(any)).thenAnswer((_) async => Right(allTodoModel));
        // act
        todoCubit.getAllTodoData(ggetAllTodo: mockGetAllTodo);
        await untilCalled(mockGetAllTodo(NoParams()));
        // assert
        verify(mockGetAllTodo(NoParams()));
      },
    );

    blocTest<TodoCubit, TodoState>(
      'emits [loading, success] when data is not empty',
      build: () => todoCubit,
      act: (cubit) {
        when(mockGetAllTodo(any)).thenAnswer((_) async => Right(allTodoModel));
        cubit.getAllTodoData(ggetAllTodo: mockGetAllTodo);
      },
      expect: () => [
        const TodoState(status: ApiStatus.loading, todoModel: []),
        TodoState(status: ApiStatus.success, todoModel: allTodoModel),
      ],
    );
    blocTest<TodoCubit, TodoState>(
      'emits [loading, success] when data is empty',
      build: () => todoCubit,
      act: (cubit) {
        when(mockGetAllTodo(any)).thenAnswer((_) async => const Right([]));
        cubit.getAllTodoData(ggetAllTodo: mockGetAllTodo);
      },
      expect: () => [
        const TodoState(status: ApiStatus.loading, todoModel: []),
        const TodoState(status: ApiStatus.success, todoModel: []),
      ],
    );
    blocTest<TodoCubit, TodoState>(
      'emits [loading, failure] when exception is thrown',
      build: () => todoCubit,
      act: (cubit) {
        when(mockGetAllTodo(any))
            .thenAnswer((_) async => const Left(FirebaseFailure('')));
        cubit.getAllTodoData(ggetAllTodo: mockGetAllTodo);
      },
      expect: () => [
        const TodoState(status: ApiStatus.loading, todoModel: []),
        const TodoState(status: ApiStatus.failure, todoModel: []),
      ],
    );
  });
}
