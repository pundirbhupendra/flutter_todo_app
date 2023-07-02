part of 'todo_form_cubit.dart';

enum ApiStatus { initial, loading, success, failure }

class TodoFormState extends Equatable {
  const TodoFormState({
    this.status = ApiStatus.initial,
    this.message = '',
  });

  final ApiStatus status;
  final String message;

  TodoFormState copyWith({ApiStatus? status, String? message}) {
    return TodoFormState(
        status: status ?? this.status, message: message ?? this.message);
  }

  @override
  String toString() {
    return '''TodoFormState { status: $status message: $message }''';
  }

  @override
  List<Object> get props => [status, message];
}
