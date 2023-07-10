// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_todo_app_clean_code/test/domain/usecases/todo/get_all_todo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter_todo_app_clean_code/core/error/failures.dart' as _i5;
import 'package:flutter_todo_app_clean_code/data/models/todo/todo_model.dart'
    as _i6;
import 'package:flutter_todo_app_clean_code/domain/repositories/todo/todo_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i3.TodoRepository {
  MockTodoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.TodoModel>> getTodo(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTodo,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.TodoModel>>.value(
            _FakeEither_0<_i5.Failure, _i6.TodoModel>(
          this,
          Invocation.method(
            #getTodo,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.TodoModel>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TodoModel>>> getAllTodo() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllTodo,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.TodoModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.TodoModel>>(
          this,
          Invocation.method(
            #getAllTodo,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TodoModel>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> addTodo(String? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTodo,
          [task],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #addTodo,
            [task],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> getDeleteTodo(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDeleteTodo,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #getDeleteTodo,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}
