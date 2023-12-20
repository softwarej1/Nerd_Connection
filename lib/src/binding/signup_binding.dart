import 'package:flutter_getx_palette_diary/src/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
