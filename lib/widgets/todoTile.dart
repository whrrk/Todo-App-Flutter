import 'package:contact/widgets/todoCheckBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/MainController.dart';
import '../models/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed('/todo?id=${todo.id}');
      },
      leading: TodoCheckbox(todo),
      title: Text(
        todo.description,
        maxLines: 1,
        style: todo.done
            ? const TextStyle(
          color: Colors.grey,
          fontSize: 30,
          decoration: TextDecoration.lineThrough,
        ) : const TextStyle(fontSize: 30),
      ),
      trailing: IconButton(
        onPressed: () {
          Get.find<MainController>().remove(todo);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}