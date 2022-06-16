import 'package:flutter/material.dart';
import 'package:farm_o/components/components.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../Features/Penjadwalan/datapakan.dart';

class show_data_pakan extends StatefulWidget {
  const show_data_pakan({ Key? key }) : super(key: key);

  @override
  State<show_data_pakan> createState() => _show_data_pakanState();
}

class _show_data_pakanState extends State<show_data_pakan> {
  final controlID = TextEditingController();
  final controlJenisTernak = TextEditingController();
  final controlNamaPakanTambahan = TextEditingController();
  final controlTanggalPakan = TextEditingController();
  final controlStatus = TextEditingController();

  @override
  Widget build(BuildContext context ) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      appBar: AppBar(
        title: Text("Data Pakan Hewan Ternak"),
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
            child: Image.asset("assets/fbg3.png", width: 80,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.blue,
                padding: EdgeInsets.fromLTRB(33, 10, 10, 0),
                // margin: EdgeInsets.all(10),
                child: Text("Tanggal Pakan: "+data.TanggalPakan),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Nama Pakan Tambahan: "+data.NamaPakanTambahan),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Jenis Ternak: "+data.JenisTernak),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 10),
                child: Text("Status: "+data.Status),
              ),
            ],
          ),
        ],
        ),
      )
  ],
);


Stream<List<Data>> readData() => FirebaseFirestore.instance.collection("data_pakan_hewan_ternak")
.snapshots().map((snapshots)=> 
snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());
