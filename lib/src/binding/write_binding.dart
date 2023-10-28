import 'package:flutter_getx_palette_diary/src/controller/write_controller.dart';
import 'package:get/get.dart';

class WriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WriteController());
  }
}
