import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/profile_controller.dart';

class ProfileInformation extends StatelessWidget {
  final ProfileController controller;
  const ProfileInformation({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '내 정보',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: GestureDetector(
              onTap: () {
                controller.pfmgo();
              },
              child: const Text(
                '내 프로필 수정하기',
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
