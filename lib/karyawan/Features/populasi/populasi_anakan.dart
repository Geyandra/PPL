import 'dart:js';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Features/Populasi/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farm_o/components/components.dart';

class populasi_anakan extends StatefulWidget {
  const populasi_anakan({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                      title: Text("Tambah Data"),
                      backgroundColor: Colors.green,
                      contentPadding: EdgeInsets.all(screenWidth * 0.05),
                      children: [
                        RoundedInputField(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          hinText: "Jumlah",
                          icon: Icons.pets,
                          control: controlJumlah,
                        ),
                        RoundedInputField(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          hinText: "Tanggal Pendataan (tanggal-bulan-tahun)",
                          icon: Icons.date_range_outlined,
                          control: controlTanggalPendataan,
                        ),
                        RoundedInputField(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          hinText: "Kesehatan Ternak",
                          icon: Icons.health_and_safety,
                          control: controlKesehatanTernak,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(30)),
                                margin: EdgeInsets.only(top: 30),
                                child: TextButton(
                                    onPressed: () {
                                      final data = Data(
                                          ID: controlID.text,
                                          JenisTernak: "Anakan",
                                          Jumlah: int.parse(controlJumlah.text),
                                          TanggalPendataan:
                                              controlTanggalPendataan.text,
                                          KesehatanTernak:
                                              controlKesehatanTernak.text);
                                      createData(data);
                                      controlID.text = '';
                                      controlJenisTernak.text = '';
                                      controlJumlah.text = '';
                                      controlTanggalPendataan.text = '';
                                      controlKesehatanTernak.text = '';
                                      Fluttertoast.showToast(
                                          msg: "Data Berhasil disimpan");
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Simpan",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black)))),
                            Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.green.shade800,
                                ),
                                margin: EdgeInsets.only(top: 30),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Batalkan",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white))))
                          ],
                        ),
                      ],
                    ));
          },
          child: Icon(Icons.add)),
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
              return Center(
                child: CircularProgressIndicator(),
              );
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  "assets/fbg3.png",
                  width: 80,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.blue,
                    padding: EdgeInsets.fromLTRB(33, 10, 10, 0),
                    // margin: EdgeInsets.all(10),
                    child: Text("Tanggal Pendataan: " + data.TanggalPendataan),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child: Text("Jenis Ternak: " + data.JenisTernak),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child: Text("Jumlah Ternak: " + '${data.Jumlah}'),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 10),
                    child: Text("Status: " + data.KesehatanTernak),
                  ),
                ],
              ),
              update(
                data: data,
              )
            ],
          ),
        )
      ],
    );

class update extends StatefulWidget {
  update({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Data data;

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  final controlID = TextEditingController();
  final controlJenisTernak = TextEditingController();
  final controlJumlah = TextEditingController();
  final controlTanggalPendataan = TextEditingController();
  final controlKesehatanTernak = TextEditingController();

  @override
  void initState() {
    controlID.text = widget.data.ID;
    controlJenisTernak.text = widget.data.JenisTernak;
    controlJumlah.text = widget.data.Jumlah.toString();
    controlTanggalPendataan.text = widget.data.TanggalPendataan;
    controlKesehatanTernak.text = widget.data.KesehatanTernak;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                        backgroundColor: Colors.green.shade100,
                        contentPadding: EdgeInsets.all(10),
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextField(
                              controller: controlJumlah,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.pets),
                                label: Text("Jumlah"),
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextField(
                              controller: controlTanggalPendataan,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.date_range_outlined),
                                label: Text("Tanggal Pendataan"),
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextField(
                              controller: controlKesehatanTernak,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.health_and_safety),
                                label: Text("Kesehatan Ternak"),
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(30)),
                                margin: EdgeInsets.only(top: 30),
                                child: TextButton(
                                    onPressed: () {
                                      final data = Data(
                                        ID: widget.data.ID,
                                        JenisTernak: widget.data.JenisTernak,
                                        Jumlah: int.parse(controlJumlah.text),
                                        TanggalPendataan:
                                            controlTanggalPendataan.text,
                                        KesehatanTernak:
                                            controlKesehatanTernak.text,
                                      );
                                      updateData(data);
                                      controlJumlah.text = '';
                                      controlTanggalPendataan.text = '';
                                      controlKesehatanTernak.text = '';
                                      Fluttertoast.showToast(
                                          msg: "Data Berhasil disimpan");
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Simpan",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black))),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.red.shade300,
                                    borderRadius: BorderRadius.circular(30)),
                                margin: EdgeInsets.only(top: 30),
                                child: TextButton(
                                    onPressed: () {
                                      controlJumlah.text = '';
                                      controlTanggalPendataan.text = '';
                                      controlKesehatanTernak.text = '';
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Batal",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white))),
                              )
                            ],
                          )
                        ],
                      ));
            },
            icon: Icon(Icons.edit_note)));
  }
}

Stream<List<Data>> readData() => FirebaseFirestore.instance
    .collection("populasi_hewan_ternak")
    .where('JenisTernak', isEqualTo: "Anakan")
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());

Future createData(Data data) async {
  final docData = FirebaseFirestore.instance
      .collection("populasi_hewan_ternak")
      .doc();
  data.ID = docData.id;
  final json = data.toJson();
  docData.set(json);
}

Future updateData(Data data) async {
  final docData = FirebaseFirestore.instance
      .collection("populasi_hewan_ternak")
      .doc(data.ID);
  data.ID = docData.id;
  final json = data.toJson();
  docData.update(json);
}
