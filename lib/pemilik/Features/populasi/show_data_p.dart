import 'dart:js';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../Features/Populasi/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farm_o/components/components.dart';

class show_data_p extends StatefulWidget {
  const show_data_p({ Key? key }) : super(key: key);

  @override
  State<show_data_p> createState() => _show_data_pState();
}

class _show_data_pState extends State<show_data_p> {
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
      margin: EdgeInsets.symmetric(horizontal: 641, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color.fromARGB(255, 255, 255, 255),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            InkWellCard(
              texttgl: 'Tanggal : '+data.TanggalPendataan,
              text: 'ID : ' + data.ID,
              dialog: SimpleDialog(children: [
                Container(
              margin: EdgeInsets.all(10),
              child: Text("Jenis Ternak : "+data.JenisTernak),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("Jumlah : "+ '${data.Jumlah}'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("Tanggal Pendataan : "+data.TanggalPendataan),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("Kesehatan Ternak : "+data.KesehatanTernak),
            ),
            ButtonOnDialog(
              title: 'Done',
              insertpadding: EdgeInsets.all(10),
              insertmargin: EdgeInsets.only(top: 10),
              color: Colors.white,
              colortext: Colors.black,
              sizetext: 14,
              ),
              ],
              ),
              ),
        ],
        ),
      )
  ],
);


Stream<List<Data>> readData() => FirebaseFirestore.instance.collection("populasi_hewan_ternak")
.snapshots().map((snapshots)=> 
snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());

// Future createData (Data data) async {
//   final docData = FirebaseFirestore.instance.collection("populasi_hewan_ternak").doc(data.ID);
//   data.ID = docData.id;
//   final json = data.toJson();
//   docData.set(json);}

// Future updateData (Data data) async {
//   final docData = FirebaseFirestore.instance.collection("populasi_hewan_ternak").doc(data.ID);
//   data.ID = docData.id;
//   final json = data.toJson();
//   docData.update(json);}