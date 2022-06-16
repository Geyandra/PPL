
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_o/karyawan/acc_k.dart';
import 'package:farm_o/karyawan/homepage_k(alt).dart';
import 'package:farm_o/karyawan/login_k.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/components.dart';


class signup_k extends StatefulWidget {
  const signup_k({ Key? key }) : super(key: key);

  @override
  State<signup_k> createState() => _signup_kState();
  
}

class _signup_kState extends State<signup_k> {
  final formKey = GlobalKey<FormState>();
  final controlFirstName = TextEditingController();
  final controlLastName = TextEditingController();
  final controlPhoneNumber = TextEditingController();
  final controlEmail = TextEditingController();
  final controlPassword = TextEditingController();
  final controlconfirmPassword = TextEditingController();
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
                      MaterialPageRoute(builder:(context){return login_k();},),);},
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
                  hinText: "First Name", 
                  icon: Icons.person_add,
                  control: controlFirstName, 
                  validatorvalue: (value) {
                    if (value!.isEmpty) {
                      return ("Data tidak boleh kosong");
                    }
                    return null;
                  }
                  ),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, 
                  hinText: "Last Name", 
                  icon: Icons.person_add,
                  control: controlLastName,
                  validatorvalue: (value) {
                    if (value!.isEmpty) {
                      return ("Data tidak boleh kosong");
                    }
                    return null;
                  } 
                  ),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight,
                  hinText: "Phone Number",
                  icon: Icons.phone_android,
                  control: controlPhoneNumber,
                  validatorvalue: (value) {
                    if (value!.isEmpty) {
                      return ("Data tidak boleh kosong");
                    }
                    return null;
                  }
                  ),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight,
                  hinText: 'Your Email',
                  icon: Icons.mail_outline_sharp,
                  control: controlEmail,
                  validatorvalue: (value) {
                    if (value!.isEmpty) {
                      return ("Data tidak boleh kosong");
                    }
                    return null;
                  }
                  ),
                  RoundedPasswordField(screenWidth: screenWidth, screenHeight: screenHeight, 
                  control: controlPassword,
                  validatorvalue: (value) {
                    if (value!.isEmpty) {
                      return ("Data tidak boleh kosong");
                    }
                    return null;
                  },
                  hinText: 'Password',),
                  RoundedPasswordField(screenWidth: screenWidth, screenHeight: screenHeight, 
                  hinText: "Confirm Password",
                  control: controlconfirmPassword,
                  validatorvalue: (value){
                    if (value!.isEmpty) {
                      return ("Data tidak boleh kosong");
                    }
                    if (controlconfirmPassword.text != controlPassword.text) {
                      return "Password Berbeda";
                    }
                    return null;
                  }, 
                  ),
                  Container(
                  padding: EdgeInsets.only(top: screenHeight*0.1, bottom: screenHeight*0.15),
                  child: ElevatedButton(
                      onPressed: signUp,
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
              ),
            ),
          ],
        ),
        ),
      ),
      
    );
  }
  void signUp() async{
    if (formKey.currentState!.validate()) {
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: controlEmail.text.trim(), password: controlPassword.text.trim())
        .then((uid) => {
          Fluttertoast.showToast(msg: "Data Berhasil dibuat"),
          Navigator.push(context,
  MaterialPageRoute(builder:(context){return homepage_k();},),),
        });
      }on FirebaseAuthException catch(e) {
        print(e);
      }
      final data = Data(
        FirstName: controlFirstName.text, 
        LastName: controlLastName.text, 
        PhoneNumber: int.parse(controlPhoneNumber.text), 
        Email: controlEmail.text);
        createData(data);
    }
  }

}
Future createData (Data data) async {
  final docData = FirebaseFirestore.instance.collection("Akun_Karyawan").doc();
  data.ID = docData.id;
  final json = data.toJson();
  docData.set(json);}
