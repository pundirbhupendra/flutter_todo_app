// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String task;
  final int id;

  Todo({required this.task, required this.id});

  @override
  List<Object> get props => [task, id];
}

class Todos extends Equatable {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  @override
  List<Object?> get props => [id, todo, completed, userId];
}
