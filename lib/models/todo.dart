import 'dart:convert';

import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  final String id;
  final String description;
  final bool done;

  Todo({required this.description, this.done = false}) : id = DateTime.now().millisecondsSinceEpoch.toString();

  const Todo.withId(
      {required this.id, required this.description, this.done = false});

  static const initialTodos = [
    Todo.withId(
      id: '0',
      description: '플러터 스터디 관련\n\n 1주차: xxx \n 2주차: xxxx',
    ),
    Todo.withId(
      id: '1',
      description: '여행 계획\n\n 1주차: xxx \n 2주차: xxxx',
    ),
    Todo.withId(
      id: '2',
      description: '운동 계획\n\n 1주차: 상체 2분할 및 하체',
    ),
  ];

  Todo copy({
    String? id,
    String? description,
    bool? done,
  }) {
    return Todo.withId(
      id: id ?? this.id,
      description: description ?? this.description,
      done: done ?? this.done,
    );
  }
}