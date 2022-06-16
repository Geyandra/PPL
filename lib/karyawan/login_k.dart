import 'dart:ui';
import 'package:farm_o/karyawan/acc_k.dart';
import 'package:farm_o/karyawan/homepage_k(alt).dart';
import 'package:farm_o/karyawan/signup_k.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/components.dart';
import 'package:flutter/material.dart';

class login_k extends StatefulWidget {
  const login_k({ Key? key }) : super(key: key);

  @override
  State<login_k> createState() => _login_kState();
}

class _login_kState extends State<login_k> {
  final formKey = GlobalKey<FormState>();
  final controlEmail = TextEditingController();
  final controlPassword = TextEditingController();

  @override
  void dispose() {
    controlEmail.dispose();
    controlPassword.dispose();

    super.dispose();
  }  
  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 149, 207, 151),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: screenHeight*0.1,
              width: screenWidth*0.1,
              child: Image.asset("assets/nobg.png")),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth*0.88, 
                      screenHeight*0.01,
                      screenWidth*0.025,
                      screenHeight/60),
                    decoration: (const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topLeft,
                        image: AssetImage("assets/nobg.png")),
                    color: Color.fromARGB(153, 47, 194, 194),
                    )),
                    child: ElevatedButton(
                      onPressed: () {Navigator.push(context,
                      MaterialPageRoute(builder:(context){return signup_k();},),);},
                      child: Text("Sign Up", 
                      style: TextStyle(
                        fontFamily: "Miriam Libre",
                        fontSize: screenWidth*0.01,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      style:
                      ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(screenWidth*0.1, screenHeight*0.05)),
                        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                          return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          );}), 
                        foregroundColor: MaterialStateProperty.all(Colors.black), 
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => states.any(
                            (element) => element == MaterialState.pressed)?
                            Colors.greenAccent : const Color.fromRGBO(88, 250, 162, 60)
                        ),
                      ),
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: screenHeight*0.2),
                    child: Text("Login Farm'O Employee", style: TextStyle(
                    fontFamily: "Mohave",
                    fontSize: screenWidth*0.06,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),),
                  ),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight,
                  hinText: 'Your Email',
                  icon: Icons.mail_outline_sharp,
                  control: controlEmail,
                  validatorvalue: (value){
                    if (value!.isEmpty) {
                      return ("Data tidak boleh kosong");
                    }
                    return null;
                  },
                  ),
                  RoundedPasswordField(screenWidth: screenWidth, screenHeight: screenHeight, 
                  hinText: 'Password',
                  control: controlPassword,
                  validatorvalue: (value){
                    if (value!.isEmpty) {
                      return ("Data tidak boleh kosong");
                    }
                    return null;
                  },
                  ),
                  Container(
                  padding: EdgeInsets.only(top: screenHeight*0.1),
                  child: ElevatedButton(
                      onPressed:LOGIN,
                      child: Text("Login", 
                      style: TextStyle(
                        fontFamily: "Miriam Libre",
                        fontSize: screenWidth*0.03,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      style: 
                      ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(screenWidth*0.2, screenHeight*0.1)),
                        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                          return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          );}), 
                        foregroundColor: MaterialStateProperty.all(Colors.black), 
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => states.any(
                            (element) => element == MaterialState.pressed)?
                            Colors.greenAccent : Color.fromRGBO(88, 250, 162, 60)
                        ),
                      ),
                      ),
                ),
                ],
              ),
            )
          ],
        ),        
      ), 
    );
  }
  void LOGIN() async{
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: controlEmail.text, password: controlPassword.text)
        .then((uid) => {
          Fluttertoast.showToast(msg: "Login Berhasil"),
          Navigator.push(context,
  MaterialPageRoute(builder:(context){return homepage_k();},),),
        });
      } on FirebaseAuthException catch(e){
        print(e);
      }
    }
  }
}

