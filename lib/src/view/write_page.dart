import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';
import 'package:flutter_getx_palette_diary/src/controller/post_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';

import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';

class WritePage extends GetView<PostController> {
  RxBool isChecked = false.obs;
  WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.postfetchData();
                Get.to(() => const App());
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _image(),
          _sharebutton(),
          _text(),
        ],
      ),
    );
  }

  Widget _image() {
    return GestureDetector(
      onTap: controller.pickImageV02,
      child: Container(
        color: Colors.grey,
        height: 400,
        width: 350,
        child: (controller.file != null)
            ? Image.file(
                File(controller.file!.path),
                fit: BoxFit.cover,
              )
            : const Icon(
                Icons.image,
                size: 50,
                color: Colors.white,
              ),
      ),
    );
  }

  Widget _text() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: CustomTextField(
        hint: '코멘트를 입력하세요.',
        validator: ValidatorUtil.validateContent,
      ),
    );
  }

  Widget _sharebutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('이 글을 다른 사람과 공유하겠습니까? ', style: TextStyle(fontSize: 16)),
        IconButton(
          onPressed: () {
            isChecked.toggle();
          },
          icon: Obx(() => isChecked.value
              ? const Icon(Icons.check_box_outlined)
              : const Icon(Icons.check_box_outline_blank)),
        ),
      ],
    );
  }
}
