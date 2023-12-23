import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/model/join.dart';

import 'package:flutter_getx_palette_diary/src/view/signup_page.dart';
import 'package:get/get.dart';

import '../repository/join_repository.dart';

class JoinController extends GetxController {
  final Rxn<Join> _joins = Rxn<Join>();

  final TextEditingController _id = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  final JoinRepository repository;
  JoinController({
    required this.repository,
  });

  TextEditingController get id => _id;
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get confirmpassword => _confirmpassword;

  void fetchData() {
    final join = {
      'id': id.text.toString(),
      'name': name.text.toString(),
      'password': password.text.toString(),
      'confirmpassword': confirmpassword.text.toString(),
    };

    repository.JoinApi(join).then((join) {
      _joins.value = join;
      Get.to(() => SignUpPage());
    });
  }

  void putData() {
    final join = {
      'id': _id.value.text,
      'name': _name.value.text,
      'password': _password.value.text.toString(),
      'confirmpassword': _confirmpassword.value.text.toString()
    };
    repository.putJoins(join);
  }
}
