import 'package:validators/validators.dart';

Function validateName() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 업습니다.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 업습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 업습니다.";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다";
    } else {
      return null;
    }
  };
}

Function validateConfirmPassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 업습니다.";
    } else if (value != validatePassword()) {
      return "비밀번호가 일치하지 않습니다.";
    } else {
      return null;
    }
  };
}
