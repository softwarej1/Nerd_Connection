import 'package:dio/dio.dart';

import 'package:flutter_getx_palette_diary/src/model/post.dart';
import 'package:flutter_getx_palette_diary/src/utils/api_url.dart';

import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class PostRepository {
  final Dio dio = Dio(); // Dio 인스턴스 초기화 및 설정

  Future<Post?> writeApi(XFile? file) async {
    try {
      if (file == null) {
        print('널이다잉');
      }
      String? accessToken = GetStorage().read('accessToken');

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

  Future<Post?> contentApi(Map<String, dynamic> json) async {
    try {
      String? accessToken = GetStorage().read('accessToken');
      print(accessToken);

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};
      print(json);

      dio.put(ApiUrls.postUrl, data: json).then((response) {
        print(accessToken);

        if (response.statusCode == 201) {
          print("성공이용");
        } else {
          print("글쓰기 실패");
          print(response.data);
          //throw Exception("글쓰기 오류");
        }
      });
    } catch (error) {
      // DioError인 경우
      if (error is DioError) {
        // 에러 타입에 따라 처리
        if (error.response != null) {
          print('Response error: ${error.response}');
        } else {
          print('Connection error: $error');
        }
      } else {
        // DioError가 아닌 경우에 대한 처리
        print('Non-DioError: $error');
      }
    }
  }

  Future<void> putContents(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.postUrl, data: json).then((response) {
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
