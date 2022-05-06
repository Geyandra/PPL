import 'package:flutter/material.dart';

class penjadwalan_hewan_ternak extends StatelessWidget {
  const penjadwalan_hewan_ternak({ Key? key }) : super(key: key);

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
              bottom: 0,
              child: Image.asset("assets/fbg2.png")),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: Text("""
Tetap Perhatikan
Pakan dan Asupan Vitamin""",
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
                              child: TextButton(onPressed: () {}, child: Image.asset("assets/animal2.png", width: screenWidth*0.05,),),
                            ),
                            Text("Penjadwalan Pakan", style: TextStyle(
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
                              child: TextButton(onPressed: () {}, child: Image.asset("assets/animal1.png", width: screenWidth*0.05,),),
                            ),
                            Text("Penjadwalan Asupan Vitamin", style: TextStyle(
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