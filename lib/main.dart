import 'package:cl_carmelo/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clinica Carmelo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        accentColor: Colors.amber.shade200
      ),
      home: LoginPage(),
    );
  }
}

