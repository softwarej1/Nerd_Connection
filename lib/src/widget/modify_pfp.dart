import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Rx<File?> _selectImageFile = Rx<File?>(null);
OverlayEntry? _overlayEntry;

void showOverlay(BuildContext context) {
  _overlayEntry = OverlayEntry(
    builder: (context) => Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.3), //불투명도 조절
          ),
        ),
        GestureDetector(
          onTap: removeOverlay, // 다른 곳을 터치하면 _removeOverlay 함수를 호출
          behavior: HitTestBehavior.translucent, // 투명 영역 탭 감지
        ),
        Positioned(
          bottom: 10.0,
          left: 5.0,
          right: 5.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      height: 23.0,
                      child: Center(
                        child: Text(
                          '프로필 사진 설정',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 23.0, // 원하는 높이로 설정
                      child: InkWell(
                        onTap: () {
                          selectImage();
                          removeOverlay();
                        },
                        child: Center(
                          child: Text(
                            '갤러리에서 사진 선택',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 23.0,
                      child: InkWell(
                        onTap: () async {
                          await captureImage();
                        },
                        child: Center(
                          child: Text(
                            '직접 사진 찍기',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, bottom: 12.0),
                    child: Container(
                      height: 35.0, // 원하는 높이로 설정
                      child: InkWell(
                        onTap: removeOverlay,
                        child: Center(
                          child: Text(
                            '기존 이미지로 변경',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
  if (_overlayEntry != null) {
    Overlay.of(context).insert(_overlayEntry!);
  }
}

void removeOverlay() {
  _overlayEntry?.remove();
  _overlayEntry = null;
}

captureImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.camera);

  if (image != null) {
    _selectImageFile.value = File(image.path);
  }
}

selectImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    _selectImageFile.value = File(image.path);
  }
}

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
