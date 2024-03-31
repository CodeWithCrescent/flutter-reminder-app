import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/pages/home_page.dart';
import 'package:reminder_app/pages/login_page.dart';

class SplashPage extends StatelessWidget {
  late Color myColor;
  late Size mediaSize;

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.to(() => HomePage());
    });
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: myColor,
          image: DecorationImage(
            image: const AssetImage('assets/images/clock.jpg'),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                child: _buildTop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_month,
            color: Colors.white,
            size: 80,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'YOUR REMINDER',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
