import 'package:farm_o/login.dart';
import 'package:flutter/material.dart';
import 'components/components.dart';
import 'homepage_p.dart';

class signup extends StatelessWidget {
  const signup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 149, 207, 151),
        body: SingleChildScrollView(
          child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: screenHeight*0.1,
              width: screenWidth*0.1,
              child: Image.asset("assets/nobg.png")),
            Column(
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
                    MaterialPageRoute(builder:(context){return login();},),);},
                    child: Text("Login", 
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
                  child: Text("Sign Up Farm'O", style: TextStyle(
                  fontFamily: "Mohave",
                  fontSize: screenWidth*0.09,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),),
                ),
                RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, 
                hinText: "Name", 
                icon: Icons.person, 
                onChanged: (value) {  }),
                RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, 
                hinText: "Birthdate", 
                icon: Icons.date_range_outlined, 
                onChanged: (value) {}),
                RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight,
                hinText: "Phone Number",
                icon: Icons.phone_android,
                onChanged: (value) {  }
                ),
                RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight,
                hinText: 'Your Email',
                icon: Icons.mail_outline_sharp,
                onChanged: (value) {  },),
                RoundedPasswordField(screenWidth: screenWidth, screenHeight: screenHeight, 
                onChanged: (value) {  }, 
                hinText: 'Password',),
                RoundedPasswordField(screenWidth: screenWidth, screenHeight: screenHeight, 
                hinText: "Confirm Password", 
                onChanged: (values) {}),
                Container(
                padding: EdgeInsets.only(top: screenHeight*0.1, bottom: screenHeight*0.15),
                child: ElevatedButton(
                    onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder:(context){return homepage_p();},),);},
                    child: Text("Sign Up", 
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
            )
          ],
        ),
        ),
      ),
      
    );
  }
}

