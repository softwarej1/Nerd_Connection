import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/view/update_page.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PALETTE',
          style: TextStyle(
            fontFamily: 'NanumGothic',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const UpdatePage());
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: _myFeed(),
    );
  }

  Widget _myFeed() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
      itemBuilder: ((context, index) => Container(
            color: Colors.blueGrey,
          )),
      itemCount: 50,
    );
  }
}
