import 'package:flutter/material.dart';

class ProfileUserName extends StatelessWidget {
  final String initialValue;

  const ProfileUserName({Key? key, required this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          textAlign: TextAlign.center,
          initialValue: initialValue,
        ),
      ),
    );
  }
}
