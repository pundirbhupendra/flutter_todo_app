// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app_clean_code/injection_container.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/todo/add_todo.dart';
import 'package:equatable/equatable.dart';

part 'todo_form_state.dart';

@lazySingleton
class TodoFormCubit extends Cubit<TodoFormState> {
  late final AddTodo addTodo;
  TodoFormCubit() : super(const TodoFormState()) {
    addTodo = getIt<AddTodo>();
  }

  void addTodoData(String task, String desc) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final todoAddedFailedOrSuccess =
        await addTodo(Params(task: task, desc: desc));
    todoAddedFailedOrSuccess.fold(
      (failure) => emit(state.copyWith(
          status: ApiStatus.failure, message: failure.errorMessage)),
      (data) {
        return emit(state.copyWith(status: ApiStatus.success));
      },
    );
  }
}
