import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final funMoveToPage;

  CustomElevatedButton({required this.text, required this.funMoveToPage});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 129, 132, 211),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: funMoveToPage,
        child: Text("$text"));
  }
}
