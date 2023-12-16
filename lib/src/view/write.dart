import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/view/home.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';

class Write extends GetView<HomeController> {
  const Write({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('글쓰기'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(const Home());
                },
                icon: const Icon(Icons.check))
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
          // _image(),
          _text(),
        ],
      ),
    );
  }

  // Widget _image() {
  //   return (controller.writeSelectedImage != null)
  //       ? SizedBox(
  //           height: 200,
  //           width: Get.size.width,
  //           child: AssetEntityImage(
  //             controller.writeSelectedImage!,
  //             isOriginal: false,
  //             fit: BoxFit.contain,
  //           ),
  //         )
  //       : Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: InkWell(
  //             onTap: () {},
  //             child: Container(
  //               width: Get.size.width,
  //               height: 250,
  //               color: Colors.grey,
  //               child: const Icon(
  //                 Icons.photo,
  //                 size: 44,
  //               ),
  //             ),
  //           ),
  //         );
  // }

  Widget _text() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          CustomTextField(hint: '코멘트를 입력하세요.', funValidator: validateContent()),
    );
  }
}
