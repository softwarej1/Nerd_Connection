import 'package:flutter/material.dart';

class WriteTextfild extends StatelessWidget {
  const WriteTextfild({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        labelText: '코멘트를 달아주세요.',
        focusedBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
