import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/user.dart';
import 'package:flutter_getx_palette_diary/src/utils/api_url.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserRepository {
  final dio = Dio();

  Future<User?> loginApi(Map<String, dynamic> json) async {
    try {
      print(json);
      return dio.post(ApiUrls.loginUrl, data: json).then((response) {
        print(response.statusCode);
        print(response.data);
        if (response.statusCode == 200) {
          String? accessToken = response.data['accessToken'];
          GetStorage().write('accessToken', accessToken);
          // print("저장한 토큰 : $accessToken");
          return User.fromJson(response.data);
        } else if (response.statusCode == 400) {
          final errorMessage = response.data['error'];
          print("로그인 실패: $errorMessage");
          return null;
        } else {
          throw Exception("잘못된 비밀번호");
        }
      }).catchError((error) {
        print("loginApi에서 Dio 오류: $error");
        throw Exception("로그인 중 오류 발생");
      });
    } catch (e) {
      print("Error in loginApi: $e");
      throw Exception("로그인 중 오류 발생");
    }
  }

  Future<void> putUsers(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.loginUrl, data: json).then((response) {
        print(response.statusCode);
        if (response.statusCode == 201) {
        } else {
          // exception
        }
        return User.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }

  Future<User?> signupApi(Map<String, dynamic> json) async {
    try {
      print(json);
      // return dio.post(ApiUrls.signupUrl, data: json).then((response) {
      final response = await dio.post(ApiUrls.signupUrl, data: json);

      print(response.statusCode);

      print(response.data);
      if (response.statusCode == 201) {
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("회원가입 실패", "아이디가 중복되었습니다.");

      throw Exception();
    }
  }

  Future<void> putSignups(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.signupUrl, data: json).then((response) {
        print(response.statusCode);
        if (response.statusCode == 201) {
        } else {
          // exception
        }
        return User.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }

  Future<User?> myinfoApi() async {
    try {
      String? accessToken = GetStorage().read('accessToken');
      dio.options.headers = {'Authorization': 'Bearer $accessToken'};
      final response = await dio.get(ApiUrls.myinfoUrl);

      print(response.statusCode);

      print(response.data);
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> putMyinfos(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.myinfoUrl, data: json).then((response) {
        print(response.statusCode);
        if (response.statusCode == 200) {
        } else {
          // exception
        }
        return User.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
