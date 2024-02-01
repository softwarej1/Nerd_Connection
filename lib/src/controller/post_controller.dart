import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/model/post.dart';

import 'package:flutter_getx_palette_diary/src/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  final Rxn<Post> _posts = Rxn<Post>();
  final Rxn<Post> _contents = Rxn<Post>();

  XFile? file;

  final TextEditingController _content = TextEditingController();
  final RxBool _share_check = false.obs;

  TextEditingController get content => _content;
  RxBool get shareCheck => _share_check;

  // 체크박스 상태를 업데이트하는 함수
  void updateCheckbox(bool value) {
    _share_check.value = value;
  }

  final PostRepository repository;
  PostController({
    required this.repository,
  });

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

  void contentFetchData(post) {
    final content = {
      'content': _content.value.text,
      'photo_url': post.photo_url,
      'share_check': _share_check.value,
    };

    repository.contentApi(content).then((content) {});
  }

  void contentPutData() {
    final content = {
      'content': _content.value.text,
      'share_check': _share_check.value,
    };
    repository.putContents(content);
  }
}
