import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/MainController.dart';
import '../models/todo.dart';

class TodoCheckbox extends StatelessWidget {
  final Todo todo;

  const TodoCheckbox(this.todo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      // 체크박스가 작을 경우
      scale: 1.5,
      child: Checkbox(
        shape: const CircleBorder(),
        checkColor: Colors.transparent,
        activeColor: Colors.grey,
        side: BorderSide(
          width: 3,
          color: Theme.of(context).colorScheme.primary,
        ),
        value: todo.done,
        onChanged: (value) {
          Get.find<MainController>().updateDone(value!, todo);
        },
      ),
    );
  }
}