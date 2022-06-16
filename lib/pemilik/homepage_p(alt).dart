import 'package:farm_o/pemilik/Features/penjadwalan/penjadwalan_hewan_ternak.dart';
import 'package:farm_o/pemilik/Features/populasi/datapopulasi.dart';
import 'package:farm_o/pemilik/Features/produksi/produksi_peternakan.dart';
import 'package:farm_o/pemilik/Features/recording/recording_penjualan.dart';
import 'package:farm_o/pemilik/data_akun.dart';
import 'package:farm_o/profile.dart';
import 'package:flutter/material.dart';

class homepage_p extends StatelessWidget {
  const homepage_p({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/fbg2.jpg"), fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: screenHeight / 120,
                left: screenWidth / 5,
                child: Image.asset(
                  "assets/fbg1.png",
                  width: screenWidth * 0.2,
                )),
            Positioned(
                right: screenWidth / 6, child: Image.asset("assets/fbg2.png")),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: Text(
                    """
Selamat Datang
Pemilik Peternakan""",
                    style: TextStyle(
                      fontFamily: "Mohave",
                      fontSize: screenWidth * 0.02,
                    ),
                  ),
                ),
                Text(
                  "MENU",
                  style: TextStyle(
                    fontFamily: "Miriam Libre",
                    fontSize: screenWidth * 0.03,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: screenWidth * 0.12,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(26, 236, 211, 0.3),
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.all(screenWidth / 110),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return penjadwalan_hewan_ternak();
                              },
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/list.png",
                          width: screenWidth * 0.05,
                        ),
                      ),
                    ),
                    Text(
                      "Penjadwalan Hewan Ternak",
                      style: TextStyle(
                        fontFamily: "Miriam Libre",
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.12,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(26, 236, 211, 0.3),
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.all(screenWidth / 110),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return produksi_peternakan();
                              },
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/bottle.png",
                          width: screenWidth * 0.05,
                        ),
                      ),
                    ),
                    Text(
                      "Produksi Peternakan",
                      style: TextStyle(
                        fontFamily: "Miriam Libre",
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        width: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(26, 236, 211, 0.3),
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: EdgeInsets.all(screenWidth / 110),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return recording_penjualan();
                                },
                              ),
                            );
                          },
                          child: Image.asset(
                            "assets/cart.png",
                            width: screenWidth * 0.05,
                          ),
                        )),
                    Text(
                      "Recording Penjualan",
                      style: TextStyle(
                        fontFamily: "Miriam Libre",
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.12,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(26, 236, 211, 0.3),
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.all(screenWidth / 110),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return populasihewanternak();
                              },
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/4.png",
                          width: screenWidth * 0.05,
                        ),
                      ),
                    ),
                    Text(
                      "Populasi Hewan Ternak",
                      style: TextStyle(
                        fontFamily: "Miriam Libre",
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.12,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(26, 236, 211, 0.3),
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.all(screenWidth / 110),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return data_akun_pegawai();
                              },
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/employees.png",
                          width: screenWidth * 0.05,
                        ),
                      ),
                    ),
                    Text(
                      "Data Pegawai",
                      style: TextStyle(
                        fontFamily: "Miriam Libre",
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
                top: screenHeight / 30,
                right: screenWidth / 100,
                height: screenHeight * 0.13,
                width: screenWidth * 0.13,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return profile();
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                            image: AssetImage("assets/2.jpg"),
                            fit: BoxFit.cover)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
