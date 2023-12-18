import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/model/user.dart';
import 'package:flutter_getx_palette_diary/src/repository/user_repository.dart';
import 'package:flutter_getx_palette_diary/src/view/home.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rxn<User> _users = Rxn<User>(); // 사용자 리스트
  final TextEditingController _id = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final UserRepository repository;
  UserController({
    required this.repository,
  });

  TextEditingController get id => _id;
  TextEditingController get password => _password;

  void fetchData() {
    final user = {
      'id': id.text.toString(),
      'password': password.text.toString(),
    };

    repository.loginApi(user).then((user) {
      _users.value = user;
      Get.to(() => Home());
    });
  }

  void putData() {
    final user = {
      'id': _id.value.text,
      'password': _password.value.text.toString()
    };
    repository.putUsers(user);
  }
}
