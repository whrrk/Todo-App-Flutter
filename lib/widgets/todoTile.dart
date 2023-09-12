import 'package:contact/widgets/todoCheckBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/MainController.dart';
import '../models/todo.dart';

// a box one of the list
// no change state
class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //지정 된 이름의 경로로 이동.
        Get.toNamed('/todo?id=${todo.id}');
      },
      //왼쪽
      leading: TodoCheckbox(todo),
      //중간
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
      //오른쪽
      trailing: IconButton(
        onPressed: () {
          Get.find<MainController>().remove(todo);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}