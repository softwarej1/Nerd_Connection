import 'package:flutter_getx_palette_diary/src/controller/post_controller.dart';
import 'package:flutter_getx_palette_diary/src/repository/post_repository.dart';
import 'package:get/get.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PostController(repository: PostRepository()));
  }
}
