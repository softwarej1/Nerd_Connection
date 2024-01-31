import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/model/post.dart';

import 'package:flutter_getx_palette_diary/src/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  final Rxn<Post> _posts = Rxn<Post>();

  XFile? file;

  final TextEditingController _content = TextEditingController();

  final PostRepository repository;
  PostController({
    required this.repository,
  });

  TextEditingController get content => _content;

  Future<void> pickImageV02() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (image) {
        if (image != null) {
          file = image;
        }
      },
    );
  }

  Future<Post?> postfetchData() async {
    final post = await repository.writeApi(file);
    if (post != null) {
      _posts.value = post;
      return post;
    } else {
      Get.snackbar(
        "글쓰기 실패",
        ".",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  void postputData() {
    final post = {
      'content': _content.value.text,
    };
    repository.putPosts(post);
  }
}
