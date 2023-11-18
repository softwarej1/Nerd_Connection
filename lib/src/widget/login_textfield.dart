import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final double height;
  final TextEditingController? controller;
  final TextInputType? type;
  final String hintText;
  final bool? obscure;
  const LoginTextField({
    Key? key,
    required this.height,
    this.controller,
    this.type,
    this.obscure,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        obscureText: obscure!,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            fontFamily: 'NanumGothic',
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: const Color(0xFFF2F2F2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(
              color: Color(0xFFA3A3A3),
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 25),
        ),
      ),
    );
  }
}
