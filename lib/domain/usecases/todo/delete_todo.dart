import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/todo/todo_repository.dart';

@lazySingleton
class DeleteTodo implements UseCase<void, Params> {
  final TodoRepository todoRepository;

  DeleteTodo(this.todoRepository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return todoRepository.getDeleteTodo(params.id);
  }
}

class Params extends Equatable {
  final String id;

  const Params({required this.id});

  @override
  List<Object> get props => [id];
}
