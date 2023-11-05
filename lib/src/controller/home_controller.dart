import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_getx_palette_diary/src/view/profile_modify.dart';
import 'package:flutter_getx_palette_diary/src/view/write.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class HomeController extends GetxController {
  Rx<DateTime> headerDate = DateTime.now().obs;
  Rx<Size> calendarSize = Size.zero.obs;
  GlobalKey calendarKey = GlobalKey();
  GlobalKey calendarHeaderKey = GlobalKey();
  Rx<Size> calendarHeaderSize = Size.zero.obs;
  var profileImagePath = ''.obs;
  Rx<File?> profileSelectedImage = Rx<File?>(null);
  final picker = ImagePicker();
  final Rxn<AssetEntity> _selectedImage = Rxn<AssetEntity>();
  AssetEntity? get writeSelectedImage => _selectedImage.value;

  void onCalendarCreated(PageController pageController) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        var calendarSizeData = getRenderBoxSize(calendarKey);
        if (calendarSizeData != null) {
          calendarSize(calendarSizeData);
        }
        var calendarHeaderSizeData = getRenderBoxSize(calendarHeaderKey);
        if (calendarHeaderSizeData != null) {
          calendarHeaderSize(calendarHeaderSizeData);
        }
      },
    );
  }

  Size? getRenderBoxSize(GlobalKey key) {
    if (key.currentContext != null) {
      var renderBox = key.currentContext!.findRenderObject() as RenderBox;
      var translation = renderBox.getTransformTo(null).getTranslation();
      return Size(0, renderBox.size.height + translation.y + 20);
    }
    return null;
  }

  void handleFabPress() {
    Get.to(() => const Write());
  }

  void pfmgo() {
    Get.to(() => const ProfileModify());
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
    } else {
      print('사진을 서택하지 않았습니다.');
    }
  }
}
