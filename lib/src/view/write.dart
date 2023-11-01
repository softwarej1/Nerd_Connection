import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/write_controller.dart';
import 'package:flutter_getx_palette_diary/src/widget/write_textfild.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:get/get.dart';

class Write extends GetView<WriteController> {
  const Write({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('글쓰기'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.check))
          ],
        ),
        body: _body(),
      ),
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
    return (controller.selectedImage != null)
        ? SizedBox(
            height: 200,
            width: Get.size.width,
            child: AssetEntityImage(
              controller.selectedImage!,
              isOriginal: false,
              fit: BoxFit.contain,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: Get.size.width,
                height: 250,
                color: Colors.grey,
                child: const Icon(
                  Icons.photo,
                  size: 44,
                ),
              ),
            ),
          );
  }

  Widget _text() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: WriteTextfild(),
    );
  }
}
