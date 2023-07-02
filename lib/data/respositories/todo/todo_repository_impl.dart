import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import '../../datasources/todo/todo_local_data_source.dart';
import '../../../domain/entities/todo/todo.dart';
import '../../../domain/repositories/todo/todo_repository.dart';
import '../../datasources/todo/todo_remote_data_source.dart';
import '../../models/todo/todo_model.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource todoLocalDataSource;
  final TodoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TodoRepositoryImpl(
      {required this.todoLocalDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<TodoModel>>> getAllTodo() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.getAllTodo());
      }
      return Right(await remoteDataSource.getAllTodo());
      //  return Right(await todoLocalDataSource.getAllTodo());
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, Todos>> addTodo(String task) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.addTodo(task));
      }
      // Right(await remoteDataSource.addTodo(task));
      final Todos todo = await remoteDataSource.addTodo(task);
      return Right(todo);
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> getDeleteTodo(String id) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.deleteTodo(id));
      }
      // Right(await remoteDataSource.addTodo(task));
      final todo = await remoteDataSource.deleteTodo(id);
      return Right('');
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, TodoModel>> getTodo(int id) async {
    try {
      return Right(await todoLocalDataSource.getTodo(id));
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}
