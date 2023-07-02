import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../../data/models/todo/todo_model.dart';
import '../../repositories/todo/todo_repository.dart';
import 'package:equatable/equatable.dart';

@LazySingleton(as: UseCase)
class GetTodo implements UseCase<TodoModel, Params> {
  final TodoRepository todoRepository;

  GetTodo(this.todoRepository);

  @override
  Future<Either<Failure, TodoModel>> call(Params params) async {
    return await todoRepository.getTodo(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params({required this.id});

  @override
  List<Object> get props => [id];
}
