import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? errorMessage;

  const Failure([this.errorMessage]);

  @override
  List<dynamic> get props => [errorMessage];
}

class FirebaseFailure extends Failure {
  final String? error;
  const FirebaseFailure([this.error]) : super(error);
}
