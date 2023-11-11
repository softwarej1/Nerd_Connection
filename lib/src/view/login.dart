import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/login_controller.dart';
import 'package:flutter_getx_palette_diary/src/widget/image_data.dart';
import 'package:flutter_getx_palette_diary/src/widget/login_button.dart';
import 'package:flutter_getx_palette_diary/src/widget/login_textfield.dart';
import 'package:get/get.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.initScreenWidth(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _loginText(),
            _loginTextFiled(),
            _loginButton(),
            _signupButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: controller.screenHeight * 0.04),
      child: ImageData(
        path: ImagePath.loginImage,
        width: controller.screenWidth * 0.8,
      ),
    );
  }

  Widget _loginTextFiled() {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: controller.screenWidth * 0.05),
          child: LoginTextField(
            height: controller.screenHeight * 0.1,
            controller: controller.email,
            type: TextInputType.emailAddress,
            obscure: false,
            hintText: '로그인',
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: controller.screenWidth * 0.05),
          child: LoginTextField(
            height: controller.screenHeight * 0.1,
            controller: controller.password,
            type: TextInputType.text,
            obscure: true,
            hintText: '비밀번호',
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: controller.screenHeight * 0.005,
          horizontal: controller.screenWidth * 0.05),
      child: LoginButton(
        height: controller.screenWidth * 0.12,
        onPressed: controller.moveToApp,
        text: '로그인',
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF6B1DFF),
            Color(0xFF545BFF),
          ],
          stops: [0.0, 0.6],
        ),
      ),
    );
  }

  Widget _signupButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: controller.screenHeight * 0.005,
          horizontal: controller.screenWidth * 0.05),
      child: LoginButton(
        height: controller.screenWidth * 0.12,
        onPressed: controller.moveToRegister,
        text: '회원가입',
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF9D9BA0),
            Color(0xFF9D9BA0),
          ],
        ),
      ),
    );
  }
}
