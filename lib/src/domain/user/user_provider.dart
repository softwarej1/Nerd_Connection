import 'package:get/get.dart';

const host = "http://13.124.21.82:8080/users/login";

class UserProvider extends GetConnect {
  //Promise (데이터 약속)

  Future<Response> login(Map data) => post("$host/login", data);
}
