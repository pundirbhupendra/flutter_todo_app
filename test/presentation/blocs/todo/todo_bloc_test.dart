import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/delete_todo.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/get_all_todo.dart';
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo/todo_cubit.dart';
import 'package:mockito/annotations.dart';

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
}
