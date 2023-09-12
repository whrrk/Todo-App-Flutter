import 'package:get/get.dart';

import 'controllers/MainController.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}