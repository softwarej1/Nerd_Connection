import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/view/signup_page.dart';

import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  final _formkey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _logintext(),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _logintext() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 200,
        child: const Text(
          '로그인',
          style: TextStyle(
              color: Color.fromARGB(255, 129, 132, 211),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: Get.find<UserController>().id,
                  hint: "이메일",
                  funValidator: validateEmail(),
                ),
                CustomTextField(
                  controller: Get.find<UserController>().password,
                  hint: "비밀번호",
                  funValidator: validatePassword(),
                ),
                CustomElevatedButton(
                    text: "로그인",
                    funMoveToPage: () async {
                      if (_formkey.currentState!.validate()) {
                        Get.find<UserController>().fetchData();
                      } else {
                        Get.snackbar("로그인 시도", "로그인 실패");
                      }
                    }),
                TextButton(
                  onPressed: () {
                    Get.to(SignUpPage());
                  },
                  child: const Text("회원가입 하시겠습니까?",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                )
              ],
            ),
          )),
    );
  }
}
