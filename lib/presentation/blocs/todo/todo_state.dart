part of 'todo_cubit.dart';

class TodoState extends Equatable {
  const TodoState({
    this.status = ApiStatus.initial,
    this.message = '',
    this.todoModel,
  });

  final ApiStatus status;
  final String message;
  // final List<Todo> todoList;
  final List<TodoModel>? todoModel;

  TodoState copyWith(
      {ApiStatus? status, String? message, List<TodoModel>? todoModel}) {
    return TodoState(
        status: status ?? this.status,
        message: message ?? this.message,
        todoModel: todoModel ?? this.todoModel);
  }

  @override
  String toString() {
    return '''TodoState { status: $status message: $message }''';
  }

  @override
  List<Object> get props => [status, message];
}
