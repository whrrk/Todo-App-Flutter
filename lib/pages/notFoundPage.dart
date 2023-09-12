import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('※ 올바르지 않은 페이지 입니다.'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offAllNamed('/home');
          },
          child: Text('홈 화면으로'),
        ),
      ),
    );
  }
}