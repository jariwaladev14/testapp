import 'package:flutter/material.dart';
import 'package:testapp/views/home_screen2.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GraphQl Api Call",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
        textTheme: TextTheme(
          // bodySmall: TextStyle(fontSize: 20),
          // bodyMedium: TextStyle(fontSize: 25),
        ),
      ),

      home: HomeScreen2(),
    );
  }
}
