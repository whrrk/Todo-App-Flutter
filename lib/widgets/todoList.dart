import 'package:contact/widgets/actionbutton.dart';
import 'package:contact/widgets/todoTile.dart';
import 'package:flutter/material.dart';

import '../controllers/MainController.dart';

import 'package:get/get.dart';

class TodoList extends StatelessWidget {

  final bool is_complete;

  TodoList(this.is_complete, {Key? key}) : super(key: key);

  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(
                () {
              final todos = mainController.getTodoListByCondition(is_complete);
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return TodoTile(todo: todo);
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ActionButton(
                label: '새 할일',
                icon: Icons.add,
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () => Get.toNamed('/todo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}