import 'dart:convert';

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
      final response = await dio.post(ApiUrls.writeUrl, data: formData);

      // return dio.post(ApiUrls.writeUrl, data: formData).then((response) {
      if (response.statusCode == 201) {
        return Post.fromJson(response.data);
      } else if (response.statusCode == 400) {
        final errorMessage = response.data['error'];
        print("글쓰기 실패: $errorMessage");
        return null;
      } else {
        throw Exception("글쓰기 오류");
      }
      // }catchError((error) {
      //   print("writeApi에서 Dio 오류: $error");
      //   throw Exception("글쓰기 중 오류 발생");
      // });
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

  Future<Post?> contentApi(Map<String, dynamic> json1) async {
    try {
      dio.options.receiveDataWhenStatusError = true; // 오류 응답에 대한 데이터를 받도록 설정

      dio.options.contentType = 'application/json'; // 수정: 멀티파트 형식을 JSON으로 변경

      String? accessToken = GetStorage().read('accessToken');

      print(accessToken);

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};

      print('json1 유형: ${json1.runtimeType}');

      print(json1);

      // dio.put(ApiUrls.postUrl, data: json).then((response) {
      final response = await dio.put(ApiUrls.postUrl, data: jsonEncode(json1));
      print(response.statusCode);

      if (response.statusCode == 201) {
        return Post.fromJson(response.data);
      } else {
        print("글쓰기 실패");
        print(response.data);
      }
      // throw Exception("글쓰기 오류");
    } on DioException catch (error) {
      // DioException 또는 다른 예외 처리
      if (error.response != null) {
        print('Dio Response error: ${error.response}');
        // 상세한 응답 정보를 확인할 수 있습니다.
        print('Status Code: ${error.response!.statusCode}');
        print('Headers: ${error.response!.headers}');
        print('Data: ${error.response!.data}');
      } else {
        print('Dio Connection error: $error');
      }
    } catch (error) {
      if (error is DioError) {
        print('Dio Error: ${error.message}');
        if (error.response != null) {
          print('Response error: ${error.response}');
        } else {
          print('Connection error: $error');
        }
      } else {
        print('Non-Dio Error: $error');
      }
    }

    //     dio.put(ApiUrls.postUrl, data: json).then((response) {
    //       print(accessToken);

    //       if (response.statusCode == 201) {
    //         print("성공이용");
    //       } else {
    //         print("글쓰기 실패");
    //         print(response.data);
    //         //throw Exception("글쓰기 오류");
    //       }
    //     });
    //   } catch (error) {
    //     // DioError인 경우
    //     if (error is DioError) {
    //       // 에러 타입에 따라 처리
    //       if (error.response != null) {
    //         print('Response error: ${error.response}');
    //       } else {
    //         print('Connection error: $error');
    //       }
    //     } else {
    //       // DioError가 아닌 경우에 대한 처리
    //       print('Non-DioError: $error');
    //     }
    //   }
    // }
  }

  Future<void> putContents(Map<String, dynamic> json) async {
    try {
      dio.options.contentType = 'application/json'; // 수정: 멀티파트 형식을 JSON으로 변경

      dio.put(ApiUrls.postUrl, data: json).then((response) {
        print(response.statusCode);
        if (response.statusCode == 201) {
          return Post.fromJson(response.data);
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
