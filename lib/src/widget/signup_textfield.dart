import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final funValidator;

  const CustomTextField({required this.hint, required this.funValidator});

  @override
  Widget build(BuildContext context) {
    bool isPassword = hint.contains('비밀번호');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: funValidator,
        obscureText: isPassword,
        //hint == "비밀번호" ? true : false,

        decoration: InputDecoration(
            hintText: "$hint",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
