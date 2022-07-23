// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class TodoModel {
  final int id;
  final String name;
  final DateTime due_date;
  final DateTime created_at;
  final TodoTaskType task_type;
  final bool completed;
  TodoModel({
    required this.id,
    required this.name,
    required this.due_date,
    required this.created_at,
    required this.task_type,
    required this.completed,
  });

  TodoModel copyWith({
    int? id,
    String? name,
    DateTime? due_date,
    DateTime? created_at,
    TodoTaskType? task_type,
    bool? completed,
  }) {
    return TodoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      due_date: due_date ?? this.due_date,
      created_at: created_at ?? this.created_at,
      task_type: task_type ?? this.task_type,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'due_date': due_date.millisecondsSinceEpoch,
      'created_at': created_at.millisecondsSinceEpoch,
      'task_type': task_type.toMap(),
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      due_date: DateTime.parse(map['due_date']),
      created_at: DateTime.parse(map['created_at']),
      task_type: TodoTaskType.fromMap(map['task_type']),
      completed: map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TodoModel(id: $id, name: $name, due_date: $due_date, created_at: $created_at, task_type: $task_type, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoModel &&
        other.id == id &&
        other.name == name &&
        other.due_date == due_date &&
        other.created_at == created_at &&
        other.task_type == task_type &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        due_date.hashCode ^
        created_at.hashCode ^
        task_type.hashCode ^
        completed.hashCode;
  }
}

class TodoTaskType {
  final int id;
  final String name;
  TodoTaskType({
    required this.id,
    required this.name,
  });

  TodoTaskType copyWith({
    int? id,
    String? name,
  }) {
    return TodoTaskType(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory TodoTaskType.fromMap(Map<String, dynamic> map) {
    return TodoTaskType(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoTaskType.fromJson(String source) =>
      TodoTaskType.fromMap(json.decode(source));

  @override
  String toString() => 'TodoTaskType(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoTaskType && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
