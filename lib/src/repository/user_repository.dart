import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/user.dart';

class UserRepository {
  final dio = Dio();

  Future<User?> loginApi(Map<String, dynamic> json) async {
    try {
      print(json);
      return dio
          .post('http://13.124.21.82:8080/users/login', data: json)
          .then((response) {
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
      dio
          .put("http://13.124.21.82:8080/users/login/${json["id"]}", data: json)
          .then((response) {
        print(response.statusCode); // 성공시 201
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
