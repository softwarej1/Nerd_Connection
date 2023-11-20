import 'package:get/get.dart';

const host = "http://172.19.105.58:8082";

class UserProvider extends GetConnect {
  //Promise (데이터 약속)

  Future<Response> login(Map data) => post("$host/login", data);
}
