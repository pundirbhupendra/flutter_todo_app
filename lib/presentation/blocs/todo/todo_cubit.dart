import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_clean_code/injection_container.dart';
import 'package:injectable/injectable.dart';
import '../../../core/usecases/usecase.dart';
import '../../../data/models/todo/todo_model.dart';
import '../../../domain/usecases/todo/delete_todo.dart';
import '../../../domain/usecases/todo/get_all_todo.dart';
import 'package:equatable/equatable.dart';

import '../todo_form/todo_form_cubit.dart';

part 'todo_state.dart';

@lazySingleton
class TodoCubit extends Cubit<TodoState> {
  late final GetAllTodo getAllTodo;
  late final DeleteTodo deleteTodo;
  TodoCubit() : super(const TodoState()) {
    getAllTodo = getIt<GetAllTodo>();
    deleteTodo = getIt<DeleteTodo>();
  }

  void getAllTodoData() async {
    emit(state.copyWith(status: ApiStatus.loading));
    final todoAddedFailedOrSuccess = await getAllTodo(NoParams());
    todoAddedFailedOrSuccess.fold(
      (failure) => emit(state.copyWith(
          status: ApiStatus.failure, message: failure.errorMessage)),
      (data) {
        return emit(state.copyWith(status: ApiStatus.success, todoModel: data));
      },
    );
  }

  void deleteTodos(String id) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final todoAddedFailedOrSuccess = await deleteTodo(Params(id: id));
    todoAddedFailedOrSuccess.fold(
      (failure) => emit(state.copyWith(
          status: ApiStatus.failure, message: failure.errorMessage)),
      (data) {
        return emit(state.copyWith(status: ApiStatus.success));
      },
    );
  }
}
