import 'package:flutter_getx_palette_diary/src/controller/bottom_nav_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
