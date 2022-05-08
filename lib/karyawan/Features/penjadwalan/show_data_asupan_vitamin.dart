import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:farm_o/components/components.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Features/Penjadwalan/dataasupanvitamin.dart';

class show_data_asupan_vitamin extends StatefulWidget {
  const show_data_asupan_vitamin({ Key? key }) : super(key: key);

  @override
  State<show_data_asupan_vitamin> createState() => _show_data_asupan_vitaminState();
}

class _show_data_asupan_vitaminState extends State<show_data_asupan_vitamin> {
  final controlID = TextEditingController();
  final controlJenisTernak = TextEditingController();
  final controlNamaVitamin = TextEditingController();
  final controlTanggalAsupanVitamin = TextEditingController();
  final controlStatus = TextEditingController();

  @override
  Widget build(BuildContext context ) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      appBar: AppBar(
        title: Text("Data Asupan Vitamin Hewan Ternak"),
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
              texttgl: 'Tanggal : '+data.TanggalAsupanVitamin,
              text: 'ID : ' + data.ID,
              dialog: SimpleDialog(children: [
                Container(
              margin: EdgeInsets.all(10),
              child: Text("Jenis Ternak : "+data.JenisTernak),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("NamaVitamin : "+ '${data.NamaVitamin}'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("Tanggal Pendataan : "+data.TanggalAsupanVitamin),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("Kesehatan Ternak : "+data.Status),
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


Stream<List<Data>> readData() => FirebaseFirestore.instance.collection("data_asupan_vitamin_hewan_ternak")
.snapshots().map((snapshots)=> 
snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());