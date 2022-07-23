import 'package:bit_initial/data/models/failure.dart';
import 'package:bit_initial/data/models/todo.dart';
import 'package:bit_initial/utils/data/graphql-client.dart';
import 'package:bit_initial/utils/data/todo-queries.dart';
import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class TodoService {
  Future<Either<Failure, List<TodoModel>>> getTodos() async {
    final _result = await todographClient.query(QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly, document: allTodos()));

    if (_result.hasException) {
      if (_result.exception is LinkException) {
        return left(Failure("Network Error"));
      } else {
        return left(Failure(_result.exception!.graphqlErrors.first.message,
            message:
                _result.exception!.graphqlErrors.first.extensions.toString()));
      }
    } else {
      List<TodoModel> _data = (_result.data!['todos'] as List)
          .map((e) => TodoModel.fromMap(e))
          .toList();

      return right(_data);
    }
  }

  Future<Either<Failure, List<TodoTaskType>>> getTaskTypes() async {
    final _result =
        await todographClient.query(QueryOptions(document: taskType()));

    if (_result.hasException) {
      if (_result.exception is LinkException) {
        return left(Failure("Network Error"));
      } else {
        return left(Failure(_result.exception!.graphqlErrors.first.message,
            message:
                _result.exception!.graphqlErrors.first.extensions.toString()));
      }
    } else {
      List<TodoTaskType> _data = (_result.data!['task_type'] as List)
          .map((e) => TodoTaskType.fromMap(e))
          .toList();

      return right(_data);
    }
  }

  Future<Either<Failure, bool>> deleteTodo(int id) async {
    final _result = await todographClient.mutate(
        MutationOptions(document: deleteTodoMutation(), variables: {"id": id}));

    if (_result.hasException) {
      if (_result.exception is LinkException) {
        return left(Failure("Network Error"));
      } else {
        return left(Failure(_result.exception!.graphqlErrors.first.message,
            message:
                _result.exception!.graphqlErrors.first.extensions.toString()));
      }
    } else {
      return right(true);
    }
  }

  Future<Either<Failure, Unit>> newTodo(Map<String, dynamic> data) async {
    final _result = await todographClient.mutate(MutationOptions(
        document: alternativeAddTodo(), variables: {"data": data}));

    if (_result.hasException) {
      if (_result.exception is LinkException) {
        return left(Failure("Network Error"));
      } else {
        return left(Failure(_result.exception!.graphqlErrors.first.message,
            message:
                _result.exception!.graphqlErrors.first.extensions.toString()));
      }
    } else {
      return right(unit);
    }
  }

  Future<Either<Failure, Unit>> updateTodo(
      int id, Map<String, dynamic> data) async {
    final _result = await todographClient.mutate(MutationOptions(
        document: updateTodoMutation(), variables: {"id": id, "data": data}));

    if (_result.hasException) {
      if (_result.exception is LinkException) {
        return left(Failure("Network Error"));
      } else {
        return left(Failure(_result.exception!.graphqlErrors.first.message,
            message:
                _result.exception!.graphqlErrors.first.extensions.toString()));
      }
    } else {
      return right(unit);
    }
  }
}
