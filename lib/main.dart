import 'package:farm_o/Features/Penjadwalan/show_data_asupan_vitamin.dart';
import 'package:farm_o/Features/Penjadwalan/show_data_pakan.dart';
import 'package:farm_o/Features/Populasi/show_data_k.dart';
import 'package:farm_o/Features/Populasi/show_data_p.dart';
import 'package:farm_o/SignUp.dart';
import 'package:farm_o/homepage_k(alt).dart';
import 'package:farm_o/homepage_p(alt).dart';
import 'package:farm_o/login.dart';
import 'package:farm_o/signup.dart';
import 'package:farm_o/splash.dart';
import 'package:flutter/material.dart';
import 'Features/Penjadwalan/penjadwalan_hewan_ternak.dart';
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
      home: show_data_asupan_vitamin(),
    );
  }
}
