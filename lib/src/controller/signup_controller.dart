import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late double screenWidth = 0.0;
  late double screenHeight = 0.0;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  TextEditingController get name => _name;
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  TextEditingController get confirmpassword => _confirmpassword;

  void initScreenWidth(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
