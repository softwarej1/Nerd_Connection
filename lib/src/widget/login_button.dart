import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final LinearGradient gradient;

  final double height;
  const LoginButton({
    Key? key,
    required this.onPressed,
    required this.height,
    required this.text,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide.none,
        elevation: 4,
        shadowColor: Colors.black,
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'NanumGothic',
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 3.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
              child: Icon(
                Icons.arrow_forward_outlined,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
