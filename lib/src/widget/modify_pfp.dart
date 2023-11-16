import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/profile_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/profile_overlay.dart';
import 'package:get/get.dart';

class PFP extends StatelessWidget {
  final ProfileController controller;
  const PFP({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    // 위젯 배치 깨지는 문제로 유지
                    width: 150.0,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      initialValue: '기존 이름',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
