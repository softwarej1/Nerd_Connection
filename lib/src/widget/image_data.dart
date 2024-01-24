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
  static String get homeOn => 'assets/images/bottom_nav_home_on_icon.png';
  static String get homeOff => 'assets/images/bottom_nav_home_off_icon.png';
  static String get heartOn => 'assets/images/bottom_nav_heart_on_icon.png';
  static String get heartOff => 'assets/images/bottom_nav_heart_off_icon.png';
  static String get noteTextOn =>
      'assets/images/bottom_nav_note_text_on_icon.png';
  static String get noteTextOff =>
      'assets/images/bottom_nav_note_text_off_icon.png';
  static String get userAltOn =>
      'assets/images/bottom_nav_user_alt_on_icon.png';
  static String get userAltOff =>
      'assets/images/bottom_nav_user_alt_off_icon.png';
  static String get loginImage => 'assets/images/login_image.png';
}
