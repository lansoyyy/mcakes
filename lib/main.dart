import 'package:flutter/material.dart';
import 'package:mcakes/screens/auth/business_login_screen.dart';
import 'package:mcakes/screens/auth/login_screen.dart';
import 'package:mcakes/screens/business/business_home_screen.dart';
import 'package:mcakes/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MCakes',
      home: LoginPage(),
    );
  }
}
