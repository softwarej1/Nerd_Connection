import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<UserController> {
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
    return Container(
      alignment: Alignment.center,
      height: 200,
      child: const Text(
        '로그인',
        style: TextStyle(
          color: Color.fromARGB(255, 129, 132, 211),
          fontSize: 30,
          fontWeight: FontWeight.bold,
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
                controller: controller.id,
                hint: "이메일",
                validator: (value) =>
                    ValidatorUtil.validateEmail(controller.id.value.text),
              ),
              CustomTextField(
                controller: controller.password,
                hint: "비밀번호",
                validator: (value) => ValidatorUtil.validatePassword(
                    controller.password.value.text),
              ),
              CustomElevatedButton(
                text: "로그인",
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    controller.fetchData();
                  } else {
                    Get.snackbar("로그인 시도", "로그인 실패");
                  }
                },
              ),
              TextButton(
                onPressed: controller.moveToRegister,
                child: const Text(
                  "회원가입 하시겠습니까?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
