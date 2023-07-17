import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/core/usecases/usecase.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/delete_todo.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/get_all_todo.dart';
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo/todo_cubit.dart';
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo_form/todo_form_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
      final usersCubit =
          TodoCubit(getAllTodo: mockGetAllTodo, deleteTodo: mockDeleteTodo);
      // ASSERT
      expect(usersCubit.state.status, ApiStatus.initial);
    },
  );
  group('getUsers', () {
    blocTest<TodoCubit, TodoState>(
      'emits [loading, failure] when exception is thrown',
      setUp: () {
        when(() => todoCubit.getAllTodo(NoParams()))
            .thenThrow(Exception('Oops'));
      },
      build: () => todoCubit,
      act: (cubit) => cubit.getAllTodo(NoParams()),
      expect: () => [
        const TodoState(status: ApiStatus.loading, todoModel: []),
        const TodoState(status: ApiStatus.failure, todoModel: []),
      ],
    );
  });
}
