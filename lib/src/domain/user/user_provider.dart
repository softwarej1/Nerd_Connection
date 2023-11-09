import 'package:get/get.dart';

const host = "172.19.101.245:8082";

class UserProvider extends GetConnect {
  //Promise (데이터 약속)
  Future<Response> login(Map data) => post("$host/login", data);
}
