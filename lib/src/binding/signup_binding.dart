import 'package:flutter_getx_palette_diary/src/controller/join_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/signup_controller.dart';
import 'package:flutter_getx_palette_diary/src/repository/join_repository.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(JoinController(repository: JoinRepository()));
  }
}
