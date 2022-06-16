import 'package:farm_o/pemilik/Features/recording/pupuk_matang.dart';
import 'package:farm_o/pemilik/Features/recording/pupuk_mentah.dart';
import 'package:farm_o/pemilik/Features/recording/susu_matang.dart';
import 'package:farm_o/pemilik/Features/recording/susu_mentah.dart';
import 'package:flutter/material.dart';

class recording_penjualan extends StatelessWidget {
  const recording_penjualan({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
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
              bottom: screenHeight*0.1,
              left: screenWidth/5,
              child: Image.asset("assets/fbg3.png", width: screenWidth*0.2,)),
            Positioned(
              right: screenWidth/10,
              bottom: screenHeight*0.1,
              child: Image.asset("assets/fbg5.png", width: screenWidth*0.2,)),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: Text("""
Recording Penjualan""",
style: TextStyle(
  fontFamily: "Mohave",
  fontSize: screenWidth*0.02,
),),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: screenHeight*0.1),
                  child: Text("MENU", style: TextStyle(
                    fontFamily: "Miriam Libre",
                    fontSize: screenWidth*0.03,
              
                  ),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                              child: TextButton(onPressed: () {
                                Navigator.push(context,
                    MaterialPageRoute(builder:(context){return pupuk_mentah();},),);
                    }, child: Image.asset("assets/fertilizer.png", width: screenWidth*0.05,),),
                            ),
                            Text("Pupuk Mentah", style: TextStyle(
                              fontFamily: "Miriam Libre",
                              fontSize: screenWidth*0.012,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ],
                        ),
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
                              child: TextButton(onPressed: () {
                                Navigator.push(context,
                    MaterialPageRoute(builder:(context){return pupuk_matang();},),);
                    }, child: Image.asset("assets/fertilizer (2).png", width: screenWidth*0.05,),),
                            ),
                            Text("Pupuk Matang", style: TextStyle(
                              fontFamily: "Miriam Libre",
                              fontSize: screenWidth*0.012,
                              fontWeight: FontWeight.bold,
                      
                            ),),
                          ],
                        ),
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
                              child: TextButton(onPressed: () {
                                Navigator.push(context,
                    MaterialPageRoute(builder:(context){return susu_mentah();},),);
                    }, child: Image.asset("assets/milk.png", width: screenWidth*0.05,),),
                            ),
                            Text("Susu Mentah", style: TextStyle(
                              fontFamily: "Miriam Libre",
                              fontSize: screenWidth*0.012,
                              fontWeight: FontWeight.bold,
                      
                            ),),
                          ],
                        ),
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
                              child: TextButton(onPressed: () {
                                Navigator.push(context,
                    MaterialPageRoute(builder:(context){return susu_matang();},),);
                    }, child: Image.asset("assets/milk (2).png", width: screenWidth*0.05,),),
                            ),
                            Text("Susu Matang", style: TextStyle(
                              fontFamily: "Miriam Libre",
                              fontSize: screenWidth*0.012,
                              fontWeight: FontWeight.bold,
                      
                            ),),
                          ],
                        ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: screenHeight/30,
              right: screenWidth/100,
              height: screenHeight*0.13,
              width: screenWidth*0.13,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                   image: DecorationImage(image: AssetImage("assets/2.jpg"),
                    fit: BoxFit.cover)
                ),
              )
              ),
          ],
        ),
      ),
      
    );
  }
}