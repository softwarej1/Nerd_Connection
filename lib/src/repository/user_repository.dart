import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/user.dart';

class UserRepository {
  final dio = Dio();
  Future<List<User>> getUsers() async {
    try {
      return dio.get('http://13.124.21.82:8080/users/login').then((response) {
        print(response.statusCode); //성공시 200
        List<User> users = [];
        for (var data in response.data) {
          final user = User.fromJson(data);
          users.add(user);
        }
        return users;
      });
    } catch (e) {
      throw Exception();
    }
  }

  putUsers(Map<String, dynamic> json) async {
    try {
      return dio
          .put("http://13.124.21.82:8080/users/login/${json["id"]}", data: json)
          .then((response) {
        print(response.statusCode); // 성공시 201
        return User.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
