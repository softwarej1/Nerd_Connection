import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '나의 프로필',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column();
  }
}
