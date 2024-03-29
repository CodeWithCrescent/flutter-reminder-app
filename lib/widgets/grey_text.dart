import 'package:flutter/material.dart';

class GreyText extends StatelessWidget {
  const GreyText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }
}
