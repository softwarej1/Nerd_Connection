import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';

import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/signup_textfield.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
                '로그인',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _LoginForm()
          ],
        ),
      ),
    );
  }

  Widget _LoginForm() {
    return Form(
        child: Column(
      children: [
        CustomTextField(hint: "아이디"),
        CustomTextField(hint: "비밀번호"),
        CustomElevatedButton(
          text: "로그인",
          MoveToPage: () => Get.to(App()),
        ),
      ],
    ));
  }
}
