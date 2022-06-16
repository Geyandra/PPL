import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_o/Features/recording/data_penjualan.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farm_o/components/components.dart';


class susu_matang extends StatefulWidget {
  const susu_matang({ Key? key }) : super(key: key);

  @override
  State<susu_matang> createState() => _susu_matangState();
}

class _susu_matangState extends State<susu_matang> {
  final controlID = TextEditingController();
  final controlJumlah = TextEditingController();
  final controlTanggalPenjualan= TextEditingController();
  final controlJenisProduk= TextEditingController();
  final controlTotalPembayaran= TextEditingController();
  final controlMediaPembayaran= TextEditingController();

  @override
  Widget build(BuildContext context ) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      appBar: AppBar(
        title: Text("Recording Penjualan"),
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
            child: Image.asset("assets/milk (1).png", width: 80,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.blue,
                padding: EdgeInsets.fromLTRB(33, 10, 10, 0),
                // margin: EdgeInsets.all(10),
                child: Text("Tanggal Penjualan: "+data.TanggalPenjualan),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Jenis Produk: "+data.JenisProduk),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Jumlah Produk: "+'${data.Jumlah}'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Total Pembayaran: "+'${data.TotalPembayaran}'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text("Media Pembayaran: "+data.MediaPembayaran),
              ),
            ],
          ),
        ],
        ),
      )
  ],
);

Stream<List<Data>> readData() => FirebaseFirestore.instance.collection("recording_penjualan").where('JenisProduk', isEqualTo: "Susu Matang")
.snapshots().map((snapshots)=> 
snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());
