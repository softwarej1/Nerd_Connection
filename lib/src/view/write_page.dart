import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/view/home_page.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';

class WritePage extends GetView<HomeController> {
  const WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const Home());
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
        height: 100,
        width: 100,
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
}
