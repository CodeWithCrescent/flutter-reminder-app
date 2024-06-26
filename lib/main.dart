import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/pages/home_page.dart';
import 'package:reminder_app/pages/login_page.dart';
import 'package:reminder_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminder App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
