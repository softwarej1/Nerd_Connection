import 'package:flutter_getx_palette_diary/src/controller/dto/LoginReqDto.dart';
import 'package:flutter_getx_palette_diary/src/domain/user/user_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

//통신을 호출해서 응답되는 데이터를 예쁘게 가공! => json => Dart 오브젝트

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<String> login(String email, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(email, password);
    print(loginReqDto.toJson());

    Response response = await _userProvider.login(loginReqDto.toJson());
    //dynamic headers = response.headers;

    String token = response.body["accessToken"];
    return token;
  }
}
