import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final funValidator;
  final controller;
  final String? value;

  const CustomTextArea(
      {super.key,
      required this.hint,
      required this.funValidator,
      this.controller,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: funValidator,
        maxLines: 3,
        initialValue: value ?? "",
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
