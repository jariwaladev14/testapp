import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testapp/core/app_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        width: size.width,
        child: Column(
          children: [
            SvgPicture.asset(AppImages.login, width: size.width / 2),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
