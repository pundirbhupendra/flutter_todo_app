import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app_clean_code/core/usecases/usecase.dart';
import 'package:flutter_todo_app_clean_code/domain/repositories/todo/todo_repository.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/delete_todo.dart';
import 'package:flutter_todo_app_clean_code/domain/usecases/todo/get_all_todo.dart';
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo/todo_cubit.dart';
import 'package:flutter_todo_app_clean_code/presentation/blocs/todo_form/todo_form_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../../data/mock_data.dart';

class MockGetAllTodo extends Mock implements GetAllTodo {}

class MockDeleteTodo extends Mock implements DeleteTodo {}

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  group('ApiStatusX', () {
    test('returns correct values for ApiStatus.initial', () {
      const status = ApiStatus.initial;

      expect(status.isInitial, isTrue);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for ApiStatus.isLoading', () {
      const status = ApiStatus.loading;

      expect(status.isInitial, isFalse);
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for ApiStatus.success', () {
      const status = ApiStatus.success;

      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for ApiStatus.failure', () {
      const status = ApiStatus.failure;

      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isTrue);
    });
  });

  group('copyWith', () {
    late TodoCubit todoCubit;
    late DeleteTodo deleteTodo;
    late GetAllTodo getAllTodo;

    late TodoRepository todoRepository;

    setUp(() {
      deleteTodo = MockDeleteTodo();
      getAllTodo = MockGetAllTodo();
      todoRepository = MockTodoRepository();
      todoCubit = TodoCubit(getAllTodo: getAllTodo, deleteTodo: deleteTodo);
    });

    tearDown(() async {
      todoCubit.close();
    });

    test(
      'should return the same state when copyWith is called without parameters',
      () async {
        // ARRANGE
        final expected = todoCubit.state;
        // ACT
        final state = todoCubit.state.copyWith();
        // ASSERT
        expect(state, equals(expected));
      },
    );

    test(
      'should return correct state when only status is changed by copyWith',
      () async {
        // ARRANGE
        const expected = TodoState(status: ApiStatus.loading, todoModel: []);
        // ACT
        final state = todoCubit.state.copyWith(status: ApiStatus.loading);
        // ASSERT
        expect(state, equals(expected));
      },
    );

    test(
      'should return correct state when only users is changed by copyWith',
      () async {
        // ARRANGE
        final expected = TodoState(
          status: ApiStatus.initial,
          todoModel: allTodoModel,
        );
        // ACT
        final state = todoCubit.state.copyWith(todoModel: allTodoModel);
        // ASSERT
        expect(state, equals(expected));
      },
    );
    test(
        'should return correct state when all parameters are changed by copyWith',
        () async {
      final expected = TodoState(
        status: ApiStatus.success,
        todoModel: allTodoModel,
      );
      // ACT
      final state = todoCubit.state.copyWith(
        todoModel: allTodoModel,
        status: ApiStatus.success,
      );
      // ASSERT
      expect(state, equals(expected));
    });

    test(
      'should get todo from the getAllTodo use case',
      () async {
        // arrange

        // when(getAllTodo(NoParams()))
        //     .thenAnswer((_) async => Right(allTodoModel));
        // // act
        // todoCubit.getAllTodoData();
        // await untilCalled(getAllTodo(NoParams()));
        // // assert
        // verify(getAllTodo(NoParams()));
      },
    );
  });
}
