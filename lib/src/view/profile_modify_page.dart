import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:get/get.dart';

class ProfileModify extends GetView<HomeController> {
  @override
  final HomeController controller;
  ProfileModify(this.controller, {super.key});

  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text(
              '프로필 수정',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _profileImage(context),
                _userinfor(context),
              ],
            ),
          ),
        ));
  }

  Widget _profileImage(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.3;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            showOverlay(context);
          },
          child: Column(
            children: [
              ClipOval(
                child: controller.isProfileImageSet
                    ? Image.file(
                        File(controller.profileImagePath.value),
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.grey,
                        width: size,
                        height: size,
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
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextFormField(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userinfor(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextFormField(
            obscureText: true, // 비밀번호 * 처리
            decoration: const InputDecoration(labelText: 'Password'),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Phone'),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget _userintro() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '내 소개',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

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
            onTap: controller.removeOverlay, // 다른 곳을 터치하면 _removeOverlay 함수를 호출
            behavior: HitTestBehavior.translucent, // 투명 영역 탭 감지
          ),
          Positioned(
            // 오버레이 위치 설정
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
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: SizedBox(
                        height: 23.0,
                        child: Center(
                          child: Text(
                            '프로필 사진 설정',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 0.8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: 23.0, // 원하는 높이로 설정
                        child: InkWell(
                          onTap: () {
                            controller.selectImage();
                            controller.removeOverlay();
                          },
                          child: const Center(
                            child: Text(
                              '갤러리에서 사진 선택',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 0.8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: 23.0,
                        child: InkWell(
                          onTap: () async {
                            await controller.captureImage();
                          },
                          child: const Center(
                            child: Text(
                              '직접 사진 찍기',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 0.8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0, bottom: 12.0),
                      child: SizedBox(
                        height: 35.0, // 원하는 높이로 설정
                        child: InkWell(
                          onTap: controller.removeOverlay,
                          child: const Center(
                            child: Text(
                              '기존 이미지로 변경',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
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
}
