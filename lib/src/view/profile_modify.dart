import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/profile_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/profile_overlay.dart';
import 'package:flutter_getx_palette_diary/src/widget/profile_m_body.dart';
import 'package:get/get.dart';

class ProfileModify extends GetView<ProfileController> {
  @override
  final ProfileController controller;
  const ProfileModify(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '프로필 수정',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showOverlay(context);
                },
                child: Obx(
                  () {
                    return Column(
                      children: [
                        ClipOval(
                          child: controller.profileImagePath.value.isNotEmpty
                              ? Image.file(
                                  File(controller.profileImagePath.value),
                                  width: 120.0,
                                  height: 120.0,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: Colors.grey,
                                  width: 120.0,
                                  height: 120,
                                  child: const Center(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                        ),
                        _username(),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          const ModifyBody(),
          _userintro(),
        ],
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        // 위젯 배치 깨지는 문제로 유지
        width: 150.0,
        child: TextFormField(
          // 텍스트 폼 필드 소연이가 만든거로 불러오는게 나을듯
          textAlign: TextAlign.center,
          initialValue: '기존 이름',
        ),
      ),
    );
  }

  Widget _userintro() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '내 소개',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
