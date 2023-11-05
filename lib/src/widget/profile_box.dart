import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBox extends StatelessWidget {
  final ProfileController controller;
  const ProfileBox({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: double.infinity,
        height: 200.0,
        child: Row(
          children: <Widget>[
            Obx(() {
              return ClipOval(
                child: controller.profileImagePath.value.isNotEmpty
                    ? Image.file(
                        File(controller.profileImagePath.value),
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.blue,
                        width: 100.0,
                        height: 100.0,
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
              );
            }),
            const SizedBox(width: 20.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Information',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.0),
                Text(
                  '▪ 이름 : 유저 이름',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  '▪ Email : email@email.com',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
