import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../../data/models/todo/todo_model.dart';
import '../../entities/todo/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, TodoModel>> getTodo(int id);

  Future<Either<Failure, List<TodoModel>>> getAllTodo();

  Future<Either<Failure, void>> addTodo(String task);

  Future<Either<Failure, void>> getDeleteTodo(String id);
}
