import 'package:flutter_getx_palette_diary/src/domain/user/user_repository.dart';
import 'package:flutter_getx_palette_diary/src/utils/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();

  Future<void> login(String username, String password) async {
    String token = await _userRepository.login(username, password);
    jwtToken = token;
    print("jwtToken : $jwtToken");
  }
}
