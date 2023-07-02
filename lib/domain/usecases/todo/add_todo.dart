import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/todo/todo_repository.dart';
import 'package:equatable/equatable.dart';

@lazySingleton
class AddTodo implements UseCase<void, Params> {
  final TodoRepository todoRepository;

  AddTodo(this.todoRepository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return todoRepository.addTodo(params.task);
  }
}

class Params extends Equatable {
  final String task;
  final String desc;
  const Params({required this.task, required this.desc});

  @override
  List<Object> get props => [task, desc];
}
