import 'dart:js';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../Features/Populasi/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farm_o/components/components.dart';

class populasi_anakan extends StatefulWidget {
  const populasi_anakan({ Key? key }) : super(key: key);

  @override
  State<populasi_anakan> createState() => _populasi_anakanState();
}

class _populasi_anakanState extends State<populasi_anakan> {
  final controlID = TextEditingController();
  final controlJenisTernak = TextEditingController();
  final controlJumlah = TextEditingController();
  final controlTanggalPendataan = TextEditingController();
  final controlKesehatanTernak = TextEditingController();

  @override
  Widget build(BuildContext context ) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      appBar: AppBar(
        title: Text("Data Populasi Hewan Ternak"),
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
      margin: EdgeInsets.symmetric(horizontal: 590, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color.fromARGB(255, 255, 255, 255),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            child: Image.asset("assets/fbg3.png", width: 80,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.blue,
                padding: EdgeInsets.fromLTRB(33, 10, 10, 0),
                // margin: EdgeInsets.all(10),
                child: Text("Tanggal Pendataan: "+data.TanggalPendataan),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Jenis Ternak: "+data.JenisTernak),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Jumlah Ternak: "+'${data.Jumlah}'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 10),
                child: Text("Status: "+data.KesehatanTernak),
              ),
            ],
          ),
        ],
        ),
      )
  ],
);


Stream<List<Data>> readData() => FirebaseFirestore.instance.collection("populasi_hewan_ternak").where('JenisTernak', isEqualTo: "Anakan")
.snapshots().map((snapshots)=> 
snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());
