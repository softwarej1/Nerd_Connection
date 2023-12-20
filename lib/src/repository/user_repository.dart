import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/user.dart';

import '../utils/api_url.dart';

class UserRepository {
  final dio = Dio();

  Future<User?> loginApi(Map<String, dynamic> json) async {
    try {
      print(json);
      return dio.post(ApiUrls.loginUrl, data: json).then((response) {
        print(response.statusCode);
        print(response.data);
        if (response.statusCode == 200) {
          return User.fromJson(response.data);
        } else {
          return null;
        }
      });
    } catch (e) {
      throw Exception();
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
}
