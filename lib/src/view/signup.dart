import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/view/login.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/signup_textfield.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: const Text(
                '회원가입',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _SignUpForm()
          ],
        ),
      ),
    );
  }

  Widget _SignUpForm() {
    return Form(
        child: Column(
      children: [
        CustomTextField(hint: "이름"),
        CustomTextField(hint: "아이디"),
        CustomTextField(hint: "비밀번호"),
        CustomTextField(hint: "비밀번호 확인"),
        CustomElevatedButton(
          text: "회원가입",
          MoveToPage: () => Get.to(LoginPage()),
        ),
      ],
    ));
  }
}
