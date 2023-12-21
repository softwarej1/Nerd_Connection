import 'package:flutter_getx_palette_diary/src/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put((LoginController()));
  }
}
