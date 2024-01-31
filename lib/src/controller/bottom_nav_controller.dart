import 'dart:io';

import 'package:get/get.dart';

enum Page { HOME, SEARCH, UPLOAD }

class BottomNavController extends GetxController {
  final RxInt _pageIndex = 0.obs;

  final List<int> _history = [0];

  int get index => _pageIndex.value;

  void changeIndex(int value) {
    var page = Page.values[value];
    switch (page) {
      case Page.HOME:
      case Page.SEARCH:
      case Page.UPLOAD:
        moveToPage(value);

        // UserController controller = Get.find(); // Get.find()로 컨트롤러에 접근
        // controller.myinfoFetchData(); // UPLOAD 페이지에서는 myInfo 메소드 실행
        break;
    }
  }

  void moveToPage(int value) {
    if (_history.last != value && Platform.isAndroid) {
      _history.add(value);
      print(_history);
    }
    _pageIndex(value);
  }
}
