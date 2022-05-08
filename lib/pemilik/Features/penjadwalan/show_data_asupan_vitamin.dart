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
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Nama Vitamin", icon: Icons.pets, control: controlNamaVitamin, ),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Tanggal Asupan Vitamin (tanggal-bulan-tahun)", icon: Icons.date_range_outlined, control: controlTanggalAsupanVitamin, ),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Status", icon: Icons.health_and_safety, control: controlStatus, ),
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
                      NamaVitamin: controlNamaVitamin.text, 
                      TanggalAsupanVitamin: controlTanggalAsupanVitamin.text, 
                      Status: controlStatus.text);
                      createData(data);
                      controlID.text = '';
                      controlJenisTernak.text = '';
                      controlNamaVitamin.text = '';
                      controlTanggalAsupanVitamin.text = '';
                      controlStatus.text = '';
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
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Nama Vitamin", icon: Icons.pets, control: controlNamaVitamin, ),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Tanggal Asupan Vitamin (tanggal-bulan-tahun)", icon: Icons.date_range_outlined, control: controlTanggalAsupanVitamin, ),
                  RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Status", icon: Icons.health_and_safety, control: controlStatus, ),
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
                      NamaVitamin: controlNamaVitamin.text, 
                      TanggalAsupanVitamin: controlTanggalAsupanVitamin.text, 
                      Status: controlStatus.text);
                      updateData(updatedata);
                      controlID.text = '';
                      controlJenisTernak.text = '';
                      controlNamaVitamin.text = '';
                      controlTanggalAsupanVitamin.text = '';
                      controlStatus.text = '';
                    Navigator.of(context).pop();}, child: Text("Simpan", style: TextStyle(fontSize: 20, color: Colors.black)))),
                ],
              ) );},
          ),
        ],
      ),
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

Future createData (Data data) async {
  final docData = FirebaseFirestore.instance.collection("data_asupan_vitamin_hewan_ternak").doc(data.ID);
  data.ID = docData.id;
  final json = data.toJson();
  docData.set(json);}

Future updateData (Data data) async {
  final docData = FirebaseFirestore.instance.collection("data_asupan_vitamin_hewan_ternak").doc(data.ID);
  data.ID = docData.id;
  final json = data.toJson();
  docData.update(json);}