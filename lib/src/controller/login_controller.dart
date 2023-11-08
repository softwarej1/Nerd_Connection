import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';
import 'package:flutter_getx_palette_diary/src/binding/init_binding.dart';
import 'package:flutter_getx_palette_diary/src/view/signup.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _email = TextEditingController();
  final _password = TextEditingController();
  TextEditingController get email => _email;
  TextEditingController get password => _password;

  void moveToRegister() {
    Get.to(() => const SignUp());
  }

  void moveToApp() {
    Get.to(() => const App(), binding: InitBinding());
  }
}
