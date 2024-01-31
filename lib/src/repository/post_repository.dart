import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/post.dart';
import 'package:flutter_getx_palette_diary/src/utils/api_url.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class PostRepository {
  final dio = Dio();

  Future<Post?> writeApi(XFile? file) async {
    try {
      if (file == null) {
        print('널이다잉');
      }
      String? accessToken = GetStorage().read('accessToken');
      print(accessToken);
      dio.options.headers = {'Authorization': 'Bearer $accessToken'};

      dio.options.contentType = 'multipart/form-data';

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file!.path, filename: 'file.jpg')
      });

      return dio.post(ApiUrls.writeUrl, data: formData).then((response) {
        if (response.statusCode == 201) {
          return Post.fromJson(response.data);
        } else if (response.statusCode == 400) {
          final errorMessage = response.data['error'];
          print("글쓰기 실패: $errorMessage");
          return null;
        } else {
          throw Exception("글쓰기 오류");
        }
      }).catchError((error) {
        print(1);
        print("writeApi에서 Dio 오류: $error");
        throw Exception("글쓰기 중 오류 발생");
      });
    } catch (e) {
      print("Error in loginApi: $e");
      throw Exception("글쓰기 중 오류 발생");
    }
  }

  Future<void> putPosts(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.writeUrl, data: json).then((response) {
        if (response.statusCode == 201) {
        } else {
          // exception
        }
        return Post.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
