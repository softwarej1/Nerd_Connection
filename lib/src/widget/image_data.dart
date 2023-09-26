import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  final String path;
  final double width;
  const ImageData({super.key, required this.path, this.width = 60});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width / Get.mediaQuery.devicePixelRatio,
    );
  }
}

class ImagePath {
  static String get homeOn => 'assets/images/bottom_nav_home_on_icon.jpg';
  static String get homeOff => 'assets/images/bottom_nav_home_off_icon.jpg';
}
