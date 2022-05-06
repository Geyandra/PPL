// ignore_for_file: prefer_const_constructors

import 'package:farm_o/SignUp.dart';
import 'package:farm_o/login.dart';
import 'package:farm_o/login_E.dart';
import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  const splash({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 149, 207, 151)
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/3.png"),
            //     fit: BoxFit.fill
            //     ),
            //     ),
          ),
          Positioned(
            top: screenHeight*0.038,
            left: screenWidth*0.4,
            // width: screenWidth*0.08,
            child: Image.asset("assets/nobg.png", width: screenWidth*0.2,),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: screenHeight*0.3),
                alignment: Alignment.center,
                child: Text("Farm'O", style: TextStyle(
                  fontFamily: "Mohave",
                  fontSize: screenWidth*0.09,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: screenHeight*0.03),
                child: ElevatedButton(
                    onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder:(context){return login();},),);},
                    child: Text("Login As Owner", 
                    style: TextStyle(
                      fontFamily: "Miriam Libre",
                      fontSize: screenWidth*0.02,
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
              Container(
                padding: EdgeInsets.only(top: screenHeight*0.03),
                child: ElevatedButton(
                    onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder:(context){return login_E();},),);},
                    child: Text("Login As Employee", 
                    style: TextStyle(
                      fontFamily: "Miriam Libre",
                      fontSize: screenWidth*0.02,
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
              Container(
                padding: EdgeInsets.only(top: screenHeight*0.03),
                child: ElevatedButton(
                    onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder:(context){return signup();},),);},
                    child: Text("Sign Up", 
                    style: TextStyle(
                      fontFamily: "Miriam Libre",
                      fontSize: screenWidth*0.02,
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
        ],
      ),
    );
  }
}