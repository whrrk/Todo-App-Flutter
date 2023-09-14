import 'package:get/get.dart';

import '../models/todo.dart';

class MainController extends GetxController {
  final _todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    _todos.addAll(Todo.initialTodos);
  }

  List<Todo> get todos => _todos;

  Todo? getTodoById(String id) {
    try {
      return _todos.singleWhere((e) => e.id == id);
    } on StateError {
      return null;
    }
  }

  List<Todo> getTodoListByCondition(bool done) {
    return _todos.where((e) => e.done == done).toList();
  }

  void addTodo(String description) {
    final todo = Todo(description: description);
    _todos.add(todo);
  }

  void updateText(String description, Todo todo) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copy(description: description);
    _todos.setAll(index, [newTodo]);
  }

  void updateDone(bool done, Todo todo) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copy(done: done);
    _todos.setAll(index, [newTodo]);
  }

  void remove(Todo todo) {
    _todos.remove(todo);
  }

  void deleteDone() {
    _todos.removeWhere((e) => e.done == true);
  }
}