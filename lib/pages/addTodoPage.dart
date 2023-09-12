import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/MainController.dart';
import '../models/todo.dart';
import '../widgets/actionbutton.dart';

// 할일 신규 작성
// change state
class AddTodoPage extends StatefulWidget {
  final String? todoId;

  const AddTodoPage({Key? key, this.todoId}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final mainController = Get.find<MainController>();
  final textController = TextEditingController();
  Todo? todo;

  @override
  void initState() {
    super.initState();
    if (widget.todoId != null) {
      todo = mainController.getTodoById(widget.todoId!);
      if (todo != null) {
        textController.text = todo!.description;
      }
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${(todo?.description ?? '새 작업')}',maxLines: 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                TextField(
                  controller: textController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: '작업을 입력하세요.',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 25),
                  maxLines: null,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  label: '취소',
                  icon: Icons.cancel,
                  color: Colors.grey,
                  onPressed: () {

                    Get.back();
                  },
                ),
                ActionButton(
                  label: todo == null ? '추가' : '수정',
                  icon: Icons.check,
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    final text = textController.text;
                    if (todo == null && text.isNotEmpty) {
                      mainController.addTodo(text); // 新規追加
                    } else if (todo != null) {
                      mainController.updateText(text, todo!); // 既存更新
                    }

                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}