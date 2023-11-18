import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_getx_palette_diary/src/view/profile_modify.dart';
import 'package:flutter_getx_palette_diary/src/view/write.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class HomeController extends GetxController {
  //calendar
  Rx<DateTime> headerDate = DateTime.now().obs;
  Rx<Size> calendarSize = Size.zero.obs;
  GlobalKey calendarKey = GlobalKey();
  GlobalKey calendarHeaderKey = GlobalKey();
  Rx<Size> calendarHeaderSize = Size.zero.obs;
  //profile
  var profileImagePath = ''.obs;
  Rx<File?> profileSelectedImage = Rx<File?>(null);
  Rx<File?> selectedImage = Rx<File?>(null);
  final picker = ImagePicker();
  final Rxn<AssetEntity> _selectedImage = Rxn<AssetEntity>();
  //write
  AssetEntity? get writeSelectedImage => _selectedImage.value;

  // _profileImage에서 설정되어있는지
  bool get isProfileImageSet => profileImagePath.value.isNotEmpty;

//calendar 캘린더와 캘린더 헤더의 크기 계산, 함수로 전달
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

//calendar GlobalKey에 연결된 위젯 박스 크기 계산 -> 반환
  Size? getRenderBoxSize(GlobalKey key) {
    if (key.currentContext != null) {
      var renderBox = key.currentContext!.findRenderObject() as RenderBox;
      var translation = renderBox.getTransformTo(null).getTranslation();
      return Size(0, renderBox.size.height + translation.y + 20);
    }
    return null;
  }

//Write() 이동
  void handleFabPress() {
    Get.to(() => const Write());
  }

//갤러리 이동, 선택
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
    } else {
      // print('사진을 서택하지 않았습니다.');
    }
  }

  // 프로필 수정 페이지로 이동
  void pfmgo(HomeController controller) {
    Get.to(() => ProfileModify(controller));
  }
}
