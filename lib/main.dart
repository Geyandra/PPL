import 'package:farm_o/SignUp.dart';
import 'package:farm_o/login.dart';
import 'package:farm_o/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Farm'O",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splash(),
    );
  }
}
