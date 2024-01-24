import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/bottom_nav_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/view/home_page.dart';
import 'package:flutter_getx_palette_diary/src/view/my_page.dart';
import 'package:flutter_getx_palette_diary/src/view/profile.dart';
import 'package:flutter_getx_palette_diary/src/widget/image_data.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _body(),
        bottomNavigationBar: _bottom(),
      ),
    );
  }

  Widget _bottom() {
    return BottomNavigationBar(
      currentIndex: controller.index,
      onTap: controller.changeIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.homeOff),
            activeIcon: ImageData(path: ImagePath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.noteTextOff),
            activeIcon: ImageData(path: ImagePath.noteTextOn),
            label: 'feed'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.userAltOff),
            activeIcon: ImageData(path: ImagePath.userAltOn),
            label: 'myinfo'),
      ],
    );
  }

  Widget _body() {
    return IndexedStack(
      index: controller.index,
      children: const [
        Home(),
        MyPage(),
        Profile(),
      ],
    );
  }
}
