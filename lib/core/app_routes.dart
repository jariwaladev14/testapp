import 'package:flutter/material.dart';
import 'package:testapp/features/cart/presentation/view/cart_screen.dart';
import 'package:testapp/features/home/presentation/view/home_screen3.dart';
import 'package:testapp/features/login/presentation/login_screen.dart';
import 'package:testapp/home_screen.dart';
import 'package:testapp/home_screen2.dart';

class AppRoutes {
  static const String login = 'login';
  static const String home = '/home';
  static const String home2 = '/home2';
  static const String home3 = '/home3';
  static const String cart = '/cart';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
    home2: (context) => HomeScreen2(),
    home3: (context) => HomeScreen3(),
    cart: (context) => CartScreen(),
  };
}
