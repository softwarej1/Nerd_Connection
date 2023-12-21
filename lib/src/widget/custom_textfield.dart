import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?) validator;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    bool isPassword = hint.contains('비밀번호'); //이게 뭐져?
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: isPassword, // ???

        //hint == "비밀번호" ? true : false,

        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
