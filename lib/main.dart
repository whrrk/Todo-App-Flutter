import 'package:contact/pages/addTodoPage.dart';
import 'package:contact/pages/homePage.dart';
import 'package:contact/pages/notFoundPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'data/appTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      locale: null,
      defaultTransition: Transition.downToUp,
      initialRoute: '/home',
      initialBinding: AppBinding(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/todo',
          page: () => AddTodoPage(todoId: Get.parameters['id']),
        ),
      ],
      unknownRoute: GetPage(
        name: '/404',
        page: () => const NotFoundPage()
      ),
    );
  }
}