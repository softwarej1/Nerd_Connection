import 'package:flutter/material.dart';

class ModifyBody extends StatelessWidget {
  const ModifyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextFormField(
            obscureText: true, // 비밀번호 * 처리
            decoration: const InputDecoration(labelText: 'Password'),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Phone'),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
