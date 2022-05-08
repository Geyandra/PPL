import 'package:farm_o/karyawan/signup.dart';
import 'package:farm_o/profile.dart';
import 'package:farm_o/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Farm'O",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splash(),
    );
  }
}
