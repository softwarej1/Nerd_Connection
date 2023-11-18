import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/view/login.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/signup_textfield.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.to(LoginPage());
              })),
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
            _SignUpForm()
          ],
        ),
      ),
    );
  }

  Widget _SignUpForm() {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            CustomTextField(
              hint: "이름",
              funValidator: validateName(),
            ),
            CustomTextField(hint: "이메일", funValidator: validateEmail()),
            CustomTextField(
              hint: "비밀번호",
              funValidator: validatePassword(),
            ),
            CustomTextField(
              hint: "비밀번호 확인",
              funValidator: validateConfirmPassword(),
            ),
            CustomElevatedButton(
              text: "회원가입",
              funMoveToPage: () {
                if (_formkey.currentState!.validate()) {
                  Get.to(LoginPage());
                }
              },
            ),
          ],
        ));
  }
}
