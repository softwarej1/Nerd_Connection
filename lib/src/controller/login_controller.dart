import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';
import 'package:flutter_getx_palette_diary/src/binding/init_binding.dart';
import 'package:flutter_getx_palette_diary/src/binding/signup_binding.dart';
import 'package:flutter_getx_palette_diary/src/view/signup_page.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late double screenWidth = 0.0;
  late double screenHeight = 0.0;
  TextEditingController get email => TextEditingController();
  TextEditingController get password => TextEditingController();

  void moveToRegister() {
    Get.to(() => SignUpPage(), binding: SignUpBinding());
  }

  void moveToApp() {
    Get.to(() => const App(), binding: InitBinding());
  }

  void initScreenWidth(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
