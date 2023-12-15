import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/model/user.dart';
import 'package:flutter_getx_palette_diary/src/repository/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<List<User>> _users = Rx<List<User>>([]);
  final TextEditingController _id = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final userRepository = UserRepository();

  List<User> get users => _users.value;
  TextEditingController get id => _id;
  TextEditingController get password => _password;

  @override
  void onReady() {
    super.onReady();
    _fetchData();
  }

  void _fetchData() {
    userRepository.getUsers().then((data) {
      _users.value = data;
    });
  }

  void putData() {
    final user =
        User(id: _id.value.text, password: _password.value.text.toString());
    userRepository.putUsers(user.toJson()).then((value) {
      _users.value.add(value);
      _users.refresh();
    });
  }
}
