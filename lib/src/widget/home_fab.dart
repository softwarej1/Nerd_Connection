import 'package:flutter/material.dart';

class HomeFab extends StatelessWidget {
  final void Function()? onPressed;
  const HomeFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.create_outlined),
    );
  }
}
