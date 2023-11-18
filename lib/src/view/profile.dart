import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:flutter_getx_palette_diary/src/widget/profile_box.dart';
import 'package:flutter_getx_palette_diary/src/widget/profile_information.dart';
import 'package:get/get.dart';

class Profile extends GetView<HomeController> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '나의 프로필',
          style: TextStyle(
            fontFamily: 'NanumGothic',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileBox(controller: controller),
        ProfileInformation(controller: controller),
        _driver(),
      ],
    );
  }

  Widget _driver() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Divider(
        color: Color.fromARGB(108, 0, 0, 0),
        thickness: 1.0,
      ),
    );
  }
}
