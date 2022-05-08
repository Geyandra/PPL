import 'dart:js';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_o/karyawan/Features/populasi/show_data_k.dart';
import 'package:flutter/material.dart';
import '../../../Features/Populasi/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farm_o/components/components.dart';

class show_data_k extends StatefulWidget {
  const show_data_k({ Key? key }) : super(key: key);

  @override
  State<show_data_k> createState() => _show_data_kState();
}

class _show_data_kState extends State<show_data_k> {
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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            label: "Tambah Data",
            onTap: () {showDialog(context: context, builder: (context) => SimpleDialog(
          title: Text("Tambah Data"),
          backgroundColor: Colors.green,
          contentPadding: EdgeInsets.all(screenWidth*0.05),
          children: [
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "ID", icon: Icons.format_list_numbered, control: controlID,),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Jenis Ternak", icon: Icons.pets, control: controlJenisTernak, ),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Jumlah", icon: Icons.pets, control: controlJumlah, ),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Tanggal Pendataan (tanggal-bulan-tahun)", icon: Icons.date_range_outlined, control: controlTanggalPendataan, ),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Kesehatan Ternak", icon: Icons.health_and_safety, control: controlKesehatanTernak, ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(onPressed: () {  
                                   
                    final data = Data(
                      ID: controlID.text, 
                      JenisTernak: controlJenisTernak.text, 
                      Jumlah: int.parse(controlJumlah.text), 
                      TanggalPendataan: controlTanggalPendataan.text, 
                      KesehatanTernak: controlKesehatanTernak.text);
                      createData(data);
                      controlID.text = '';
                      controlJenisTernak.text = '';
                      controlJumlah.text = '';
                      controlTanggalPendataan.text = '';
                      controlKesehatanTernak.text = '';
                    Navigator.of(context).pop();}, child: Text("Simpan", style: TextStyle(fontSize: 20, color: Colors.black)))),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green.shade800,
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Batalkan", style: TextStyle(fontSize: 20, color: Colors.white))))
              ],
            ),
          ],
        ));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.edit),
            label: "Edit Data",
            onTap: () {
              showDialog(context: context, builder: (context) => SimpleDialog(
                backgroundColor: Colors.green,
                contentPadding: EdgeInsets.all(screenWidth*0.05),
                title: Text("Edit Data"),
                children: [
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "ID", icon: Icons.format_list_numbered, control: controlID,),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Jenis Ternak", icon: Icons.pets, control: controlJenisTernak, ),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Jumlah", icon: Icons.pets, control: controlJumlah, ),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Tanggal Pendataan (tanggal-bulan-tahun)", icon: Icons.date_range_outlined, control: controlTanggalPendataan, ),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Kesehatan Ternak", icon: Icons.health_and_safety, control: controlKesehatanTernak, ),
                 Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(onPressed: () {  
                    final updatedata = Data(
                      ID: controlID.text, 
                      JenisTernak: controlJenisTernak.text, 
                      Jumlah: int.parse(controlJumlah.text), 
                      TanggalPendataan: controlTanggalPendataan.text, 
                      KesehatanTernak: controlKesehatanTernak.text);
                      updateData(updatedata);
                      controlID.text = '';
                      controlJenisTernak.text = '';
                      controlJumlah.text = '';
                      controlTanggalPendataan.text = '';
                      controlKesehatanTernak.text = '';
                    Navigator.of(context).pop();}, child: Text("Simpan", style: TextStyle(fontSize: 20, color: Colors.black)))),
                ],
              ) );},
          ),
        ],
      ),
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

Future createData (Data data) async {
  final docData = FirebaseFirestore.instance.collection("populasi_hewan_ternak").doc(data.ID);
  data.ID = docData.id;
  final json = data.toJson();
  docData.set(json);}

Future updateData (Data data) async {
  final docData = FirebaseFirestore.instance.collection("populasi_hewan_ternak").doc(data.ID);
  data.ID = docData.id;
  final json = data.toJson();
  docData.update(json);}