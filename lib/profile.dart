import 'package:farm_o/components/components.dart';
import 'package:farm_o/pemilik/Features/penjadwalan/penjadwalan_hewan_ternak.dart';
import 'package:farm_o/pemilik/Features/populasi/show_data_p.dart';
import 'package:farm_o/splash.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/fbg2.jpg"),
          fit: BoxFit.cover
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: screenHeight/120,
              left: screenWidth/5,
              child: Image.asset("assets/fbg1.png", width: screenWidth*0.2,)),
            Positioned(
              right: screenWidth/6,
              child: Image.asset("assets/fbg2.png")),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: Text("""
Profile Kamu
Pemilik Peternakan""",
style: TextStyle(
  fontFamily: "Mohave",
  fontSize: screenWidth*0.02,
),),
                ),
                Text("MENU", style: TextStyle(
                  fontFamily: "Miriam Libre",
                  fontSize: screenWidth*0.03,
              
                ),),
                Column(
                  children: [
                        Container(
                          width: screenWidth*0.12,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(26, 236, 211, 0.3),
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(screenWidth/110),
                          child: TextButton(onPressed: () {showDialog(context: context, builder: (context) => SimpleDialog(
                            
          title: Text("Ubah Data Akun"),
          backgroundColor: Colors.green,
          contentPadding: EdgeInsets.all(screenWidth*0.05),
          children: [
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "First Name", icon: Icons.person_add),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Last Name", icon: Icons.person_add),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Phone Number", icon: Icons.phone_android),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "E-mail", icon: Icons.mail_outline_sharp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(onPressed: () {
                    Navigator.of(context).pop();}, child: Text("Simpan", style: TextStyle(fontSize: 20, color: Colors.black)))),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green.shade800,
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Batalkan", style: TextStyle(fontSize: 20, color: Colors.white))))
              ],
            ),
          ],
                          ));}, child: Image.asset("assets/edit.png", width: screenWidth*0.05,),),
                        ),
                        Text("Mengubah Data", style: TextStyle(
                          fontFamily: "Miriam Libre",
                          fontSize: screenWidth*0.012,
                          fontWeight: FontWeight.bold,
                      
                        ),
                        ),
                        Container(
                          width: screenWidth*0.12,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(26, 236, 211, 0.3),
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(screenWidth/110),
                          child: TextButton(onPressed: () {}, child: Image.asset("assets/setting.png", width: screenWidth*0.05,),),
                        ),
                        Text("Pengaturan", style: TextStyle(
                          fontFamily: "Miriam Libre",
                          fontSize: screenWidth*0.012,
                          fontWeight: FontWeight.bold,
                      
                        ),),
                        Container(
                          width: screenWidth*0.12,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(26, 236, 211, 0.3),
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(screenWidth/110),
                          child: TextButton(onPressed: () {showDialog(context: context, builder: (context) => SimpleDialog(
                            children: [
                              Text("Apakah Anda yakin ingin keluar?"),
                              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder:(context){return splash();},),);}, child: Text("Log Out", style: TextStyle(fontSize: 20, color: Colors.black)))),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green.shade800,
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Batalkan", style: TextStyle(fontSize: 20, color: Colors.white))))
              ],
            ),
                            ],
                          ));}, child: Image.asset("assets/logout.png", width: screenWidth*0.05,),)
                        ),
                        Text("logout",style: TextStyle(
                          fontFamily: "Miriam Libre",
                          fontSize: screenWidth*0.012,
                          fontWeight: FontWeight.bold,
                        ),),
                  ],
                ),
              ],
            ),
            Positioned(
              top: screenHeight/30,
              right: screenWidth/100,
              height: screenHeight*0.13,
              width: screenWidth*0.13,
              child: InkWell(
                onTap: () {
                  
                  showDialog(context: context, builder: (context)=> SimpleDialog(
                    title: Text("Akun"),
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("First Name :   Wahyudi"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Last Name :   Wicaksono"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Phone Number :   087xxxxxxxx3"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("E-mail :   example.12@example.com"),
                          ),
                        ],
                      )
                    ],
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                     image: DecorationImage(image: AssetImage("assets/2.jpg"),
                      fit: BoxFit.cover)
                  ),
                ),
              )
              ),
          ],
        ),
      ),
      
    );
  }
}