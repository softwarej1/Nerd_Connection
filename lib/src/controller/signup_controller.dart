/////////////////////////////////////// 제거

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late double screenWidth = 0.0;
  late double screenHeight = 0.0;

  TextEditingController get name => TextEditingController();
  TextEditingController get email => TextEditingController();
  TextEditingController get password => TextEditingController();
  TextEditingController get confirmPassword => TextEditingController();

  void initScreenWidth(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
//////////////////////////////////