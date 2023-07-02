// ignore_for_file: must_be_immutable

import '../../../domain/entities/todo/todo.dart';

class TodoModel {
  String? id;
  String? task;
  String? description;
  TodoModel({this.description, this.id, this.task});
  TodoModel.fromJson(Map<String, dynamic> json) {
    task = json['task'];
    description = json['description'];
    id = json['id'];
  }
}

class TodosData extends Todos {
  TodosData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }
}
