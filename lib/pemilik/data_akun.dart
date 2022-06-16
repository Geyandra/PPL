import 'package:farm_o/pemilik/acc_k.dart';
import 'package:flutter/material.dart';
import 'package:farm_o/components/components.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class data_akun_pegawai extends StatefulWidget {
  const data_akun_pegawai({ Key? key }) : super(key: key);

  @override
  State<data_akun_pegawai> createState() => _data_akun_pegawaiState();
}

class _data_akun_pegawaiState extends State<data_akun_pegawai> {
  @override
  Widget build(BuildContext context ) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      appBar: AppBar(
        title: Text("Data Akun Pegawai"),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Data>>(
          stream: readData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Ada Kesalahan! ${snapshot.hasError}");
            } else if (snapshot.hasData) {
              
              final datas = snapshot.data!;

              return Column(
                children: datas.map(buildData).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
          ),
      ),
    );
  }
}

Widget buildData(Data data) => Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Card(
      margin: EdgeInsets.symmetric(horizontal: 580, vertical: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color.fromARGB(255, 255, 255, 255),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            child: Image.asset("assets/farmer.png", width: 80,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.blue,
                padding: EdgeInsets.fromLTRB(33, 10, 10, 0),
                // margin: EdgeInsets.all(10),
                child: Text("Email: "+data.Email),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Nama Depan: "+data.FirstName),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Nama Belakang: "+data.LastName),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 10),
                child: Text("No HP: "+'${data.PhoneNumber}'),
              ),
            ],
          ),
        ],
        ),
      )
  ],
);


Stream<List<Data>> readData() => FirebaseFirestore.instance.collection("Akun_Karyawan")
.snapshots().map((snapshots)=> 
snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());