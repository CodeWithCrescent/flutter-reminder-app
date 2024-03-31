import 'package:flutter/material.dart';

class LoginTabBar extends StatelessWidget {
  const LoginTabBar({super.key, required this.iconPath});

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Image.asset(iconPath),
    );
  }
}
