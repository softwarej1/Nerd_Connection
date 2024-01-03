import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';
import 'package:flutter_getx_palette_diary/src/binding/signup_binding.dart';
import 'package:flutter_getx_palette_diary/src/model/user.dart';
import 'package:flutter_getx_palette_diary/src/repository/user_repository.dart';
import 'package:flutter_getx_palette_diary/src/view/home_page.dart';
import 'package:flutter_getx_palette_diary/src/view/signup_page.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rxn<User> _users = Rxn<User>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _id = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final UserRepository repository;
  UserController({
    required this.repository,
  });

  TextEditingController get name => _name;
  TextEditingController get id => _id;
  TextEditingController get password => _password;
  TextEditingController get confirmPassword => _confirmPassword;

  void fetchData() {
    final user = {
      'id': id.text.toString(),
      'password': password.text.toString(),
    };

    repository.loginApi(user).then((user) {
      if (user != null) {
        _users.value = user;
        Get.to(() => const Home());
      } else {
        print('Login failed');
      }
    }).catchError((error) {
      print('Error');
    });
  }

  void putData() {
    final user = {
      'id': _id.value.text,
      'password': _password.value.text.toString()
    };
    repository.putUsers(user);
  }

// 화면 크기별 위젯 능동적 조정
  late double screenWidth = 0.0;
  late double screenHeight = 0.0;

  void initScreenWidth(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

// SignUp view 이동
  void moveToRegister() {
    Get.to(() => SignUpPage(), binding: SignUpBinding());
  }

// App.dart 화면으로 이동
  void moveToApp() {
    Get.to(() => const App());
  }
}
