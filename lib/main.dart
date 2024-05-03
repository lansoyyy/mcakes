import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mcakes/screens/auth/business_login_screen.dart';
import 'package:mcakes/screens/auth/login_screen.dart';
import 'package:mcakes/screens/business/business_home_screen.dart';
import 'package:mcakes/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCCv99Fb2psouQR5omHd2cHFs39Tuy7kkA",
          authDomain: "mcakes-7e3b1.firebaseapp.com",
          projectId: "mcakes-7e3b1",
          storageBucket: "mcakes-7e3b1.appspot.com",
          messagingSenderId: "334546460507",
          appId: "1:334546460507:web:62df3f84c8d4b0f1aa447e"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MCakes',
      home: HomeScreen(),
    );
  }
}
