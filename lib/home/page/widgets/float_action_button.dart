import 'package:flutter/material.dart';

class HomeFloatingActionButton extends StatelessWidget {
  final void Function() onPressed;

  const HomeFloatingActionButton({Key? key, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.refresh),
    );
  }
}
