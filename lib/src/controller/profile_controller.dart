import 'dart:io';

import 'package:flutter_getx_palette_diary/src/view/profile_modify.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  final picker = ImagePicker();

  void pfmgo(ProfileController controller) {
    Get.to(() => ProfileModify(controller));
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
    } else {
      // print('사진을 서택하지 않았습니다.');
    }
  }
}
