import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../../data/models/todo/todo_model.dart';
import '../../repositories/todo/todo_repository.dart';

@lazySingleton
class GetAllTodo implements UseCase<List<TodoModel>, NoParams> {
  final TodoRepository todoRepository;

  GetAllTodo(this.todoRepository);

  @override
  Future<Either<Failure, List<TodoModel>>> call(NoParams noParams) async {
    return await todoRepository.getAllTodo();
  }
}
