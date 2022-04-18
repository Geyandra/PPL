import 'package:flutter/material.dart';

class homepage_p extends StatelessWidget {
  const homepage_p({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
      color: Color.fromARGB(255, 229, 229, 229),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
                Positioned(
                  top: screenHeight/4,
                  right: screenWidth*0.025,
                  child: Image.asset("assets/hias.png",width: screenWidth*1,),
                  ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: Text("""
Selamat Datang, 
Owner""",
style: TextStyle(
  fontFamily: "Mohave",
  fontSize: screenWidth*0.02,
),),
                  width: screenWidth,
                  height: screenHeight/5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(9, 240, 212, 1),
                        Color.fromRGBO(105, 245, 229, 0),
                      ]
                    )
                  ),
                ),
                Text("MENU", style: TextStyle(
                  fontFamily: "Miriam Libre",
                  fontSize: screenWidth*0.016,
                ),),
                Container(
                  margin: EdgeInsets.only(top: screenHeight/100, bottom: screenHeight/20),
                  width: screenWidth*0.9,
                  padding: EdgeInsets.only(top: screenHeight/100),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255,60, 255, 255)
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 217, 255),
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(screenWidth/110),
                          child: Image.asset("assets/list.png", width: screenWidth*0.1,),
                        ),
                        Text("Penjadwalan Pakan", style: TextStyle(
                          fontFamily: "Miriam Libre",
                          fontSize: screenWidth*0.012,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: screenHeight/30),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(26, 236, 211, 0.5),
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(screenWidth/110),
                          child: Image.asset("assets/bottle.png", width: screenWidth*0.1,),
                        ),
                        Text("Produksi Peternakan", style: TextStyle(
                          fontFamily: "Miriam Libre",
                          fontSize: screenWidth*0.012,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(26, 236, 211, 0.5),
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(screenWidth/110),
                          child: Image.asset("assets/drugs.png", width: screenWidth*0.1,),
                        ),
                        Text("Kualitas & Kuantitas",style: TextStyle(
                          fontFamily: "Miriam Libre",
                          fontSize: screenWidth*0.012,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(26, 236, 211, 0.5),
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(screenWidth/110),
                          child: Image.asset("assets/cart.png", width: screenWidth*0.1,),
                        ),
                        Text("Recording Penjualan",style: TextStyle(
                          fontFamily: "Miriam Libre",
                          fontSize: screenWidth*0.012,
                          fontWeight: FontWeight.bold,
                        ),),
                        Container(
                          margin: EdgeInsets.only(top: screenHeight/30),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(26, 236, 211, 0.5),
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(screenWidth/110),
                          child: Image.asset("assets/4.png", width: screenWidth*0.1,),
                        ),
                        Text("Populasi Hewan Ternak",style: TextStyle(
                          fontFamily: "Miriam Libre",
                          fontSize: screenWidth*0.012,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    )
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