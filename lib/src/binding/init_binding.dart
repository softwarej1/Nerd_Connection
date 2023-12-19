import 'package:flutter_getx_palette_diary/src/controller/bottom_nav_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/login_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/repository/user_repository.dart';

import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(HomeController());
    Get.put(LoginController());
    Get.put(UserController(repository: UserRepository()));
  }
}
