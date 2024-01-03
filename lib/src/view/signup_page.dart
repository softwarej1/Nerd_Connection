import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/view/login_page.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<UserController> {
  final _formkey = GlobalKey<FormState>();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => LoginPage());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: const Text(
                '회원가입',
                style: TextStyle(
                    color: Color.fromARGB(255, 129, 132, 211),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _signUpForm()
          ],
        ),
      ),
    );
  }

  Widget _signUpForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextField(
            hint: "이름",
            validator: ValidatorUtil.validateName,
            controller: controller.name,
          ),
          CustomTextField(
            hint: "이메일",
            validator: ValidatorUtil.validateEmail,
            controller: controller.id,
          ),
          CustomTextField(
            hint: "비밀번호",
            validator: ValidatorUtil.validatePassword,
            controller: controller.password,
          ),
          CustomTextField(
            hint: "비밀번호 확인",
            validator: (value) => ValidatorUtil.validateConfirmPassword(
                value, controller.confirmPassword.text),
            controller: controller.confirmPassword,
          ),
          CustomElevatedButton(
            text: "회원가입",
            onPressed: () {
              if (_formkey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
