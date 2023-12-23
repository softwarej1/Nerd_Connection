import 'package:dio/dio.dart';

import '../model/join.dart';
import '../utils/api_url.dart';

class JoinRepository {
  final dio = Dio();

  Future<Join?> JoinApi(Map<String, dynamic> json) async {
    try {
      print(json);
      return dio.post(ApiUrls.joinUrl, data: json).then((response) {
        print(response.statusCode);
        print(response.data);
        if (response.statusCode == 200) {
          return Join.fromJson(response.data);
        } else {
          return null;
        }
      });
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> putJoins(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.joinUrl, data: json).then((response) {
        print(response.statusCode);
        if (response.statusCode == 201) {
        } else {
          // exception
        }
        return Join.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
