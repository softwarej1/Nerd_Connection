import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? value;
  final String? Function(String?) validator;
  const CustomTextArea(
      {super.key,
      required this.hint,
      required this.controller,
      this.value,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: 3,
      initialValue: value ?? "",
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
    );
  }
}
