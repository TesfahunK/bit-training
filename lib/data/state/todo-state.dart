import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:bit_initial/data/models/failure.dart';
import 'package:bit_initial/data/models/todo.dart';
import 'package:bit_initial/data/services/service.dart';

@injectable
@singleton
class TodoStateProvider {
  final TodoService service;

  TodoStateProvider(this.service);

  final _todoSubject = BehaviorSubject<TodoState>.seeded(new TodoState());

  Stream<TodoState> get todoStream => _todoSubject.stream;

  TodoState get todos => _todoSubject.value;

  Future getTodos({bool reload = false}) async {
    if (reload) {
      _todoSubject.add(todos.copyWith(loading: true));
      final _result = await service.getTodos();

      _todoSubject.add(todos.copyWith(loading: false, data: _result));
    } else {
      if (todos.data == null || todos.data!.isLeft()) {
        final _result = await service.getTodos();
        _todoSubject.add(todos.copyWith(loading: false, data: _result));
      }
    }
  }

  close() => _todoSubject.close();
}

class TodoState {
  final bool loading;
  final Either<Failure, List<TodoModel>>? data;
  TodoState({
    this.loading = true,
    this.data,
  });

  TodoState copyWith({
    bool? loading,
    Either<Failure, List<TodoModel>>? data,
  }) {
    return new TodoState(
      loading: loading ?? this.loading,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoState && other.loading == loading && other.data == data;
  }

  @override
  int get hashCode => loading.hashCode ^ data.hashCode;
}
