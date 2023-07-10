// ignore_for_file: void_checks

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import '../../datasources/todo/todo_local_data_source.dart';
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
      return Right(await todoLocalDataSource.getAllTodo());
    } on FirebaseException {
      return const Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addTodo(String task) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.addTodo(task));
      }
      await remoteDataSource.addTodo(task).catchError((e) {});
      return Right(await remoteDataSource.addTodo(task));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> getDeleteTodo(String id) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.deleteTodo(id));
      }
      return Right(await todoLocalDataSource.getDeleteTodo(id));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, TodoModel>> getTodo(int id) async {
    try {
      return Right(await todoLocalDataSource.getTodo(id));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(e.message));
    }
  }
}
