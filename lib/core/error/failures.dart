import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const <dynamic>[];
  final String? errorMessage;

  const Failure([this.errorMessage]);

  @override
  List<dynamic> get props => properties;
}

class DataBaseFailure extends Failure {
  const DataBaseFailure();
}
