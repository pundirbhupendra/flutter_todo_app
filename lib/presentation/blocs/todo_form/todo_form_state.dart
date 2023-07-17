part of 'todo_form_cubit.dart';

enum ApiStatus { initial, loading, success, failure }

extension ApiStatusX on ApiStatus {
  bool get isInitial => this == ApiStatus.initial;
  bool get isLoading => this == ApiStatus.loading;
  bool get isSuccess => this == ApiStatus.success;
  bool get isFailure => this == ApiStatus.failure;
}

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
