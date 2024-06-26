import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/pages/home_page.dart';
import 'package:reminder_app/utils/constants.dart';
import 'package:reminder_app/widgets/grey_text.dart';
import 'package:reminder_app/widgets/login_tab_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size mediaSize;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
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
                top: 80,
                child: _buildTop(),
              ),
              Positioned(
                bottom: 0,
                child: _buildBottom(),
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

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            color: myColor,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        const GreyText(text: 'Please login to continue...'),
        const SizedBox(height: 40),
        const GreyText(text: 'Email Address'),
        _buildFormField(emailController),
        const SizedBox(height: 40),
        const GreyText(text: 'Password'),
        _buildFormField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildOtherLoginMethods(),
      ],
    );
  }

  Widget _buildFormField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? const Icon(Icons.remove_red_eye)
            : const Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            const GreyText(text: "Remember Me"),
          ],
        ),
        TextButton(
            onPressed: () {},
            child: const GreyText(text: "I forgot my password")),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => HomePage());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: myColor,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("LOGIN"),
    );
  }

  Widget _buildOtherLoginMethods() {
    return const Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GreyText(text: "Or Continue With"),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginTabBar(iconPath: 'assets/logo/facebook-144.png'),
              LoginTabBar(iconPath: 'assets/logo/google-144.png'),
              LoginTabBar(iconPath: 'assets/logo/twitterx-144.png'),
            ],
          ),
        ],
      ),
    );
  }
}
