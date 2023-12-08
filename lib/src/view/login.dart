import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';
import 'package:flutter_getx_palette_diary/src/controller/dto/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/domain/user/user_repository.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/view/signup.dart';

import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                style: TextStyle(
                    color: Color.fromARGB(255, 129, 132, 211),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _LoginForm(),
          ],
        ),
      ),
    );
  }

  Widget _LoginForm() {
    return Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: email,
                hint: "이메일",
                funValidator: validateEmail(),
              ),
              CustomTextField(
                controller: password,
                hint: "비밀번호",
                funValidator: validatePassword(),
              ),
              CustomElevatedButton(
                text: "로그인",
                funMoveToPage: () async {
                  if (_formkey.currentState!.validate()) {
                    Get.to(const App());
                    String? token =
                        await u.login(email.text.trim(), password.text.trim());
                    if (token != null) {
                      Get.to(() => const App());
                    } else {
                      Get.snackbar("로그인 시도", "로그인 실패");
                    }
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  Get.to(SignUp());
                },
                child: const Text("회원가입 하시겠습니까?",
                    style: TextStyle(
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ));
  }
}
