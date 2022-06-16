import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farm_o/components/components.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Features/Penjadwalan/dataasupanvitamin.dart';

class show_data_asupan_vitamin extends StatefulWidget {
  const show_data_asupan_vitamin({Key? key}) : super(key: key);

  @override
  State<show_data_asupan_vitamin> createState() =>
      _show_data_asupan_vitaminState();
}

class _show_data_asupan_vitaminState extends State<show_data_asupan_vitamin> {
  final formKey = GlobalKey<FormState>();
  final controlID = TextEditingController();
  final controlJenisTernak = TextEditingController();
  final controlNamaVitamin = TextEditingController();
  final controlTanggalAsupanVitamin = TextEditingController();
  final controlStatus = TextEditingController();

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
                          hinText: "Jenis Ternak",
                          icon: Icons.pets,
                          control: controlJenisTernak,
                          validatorvalue: (value) {
                            if (value == null || value.isEmpty) {
                              return "Data wajib diisi";
                            }
                            return null;
                          }),
                      RoundedInputField(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          hinText: "Nama Vitamin",
                          icon: Icons.pets,
                          control: controlNamaVitamin,
                          validatorvalue: (value) {
                            if (value == null || value.isEmpty) {
                              return "Data wajib diisi";
                            }
                            return null;
                          }),
                      RoundedInputField(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          hinText:
                              "Tanggal Asupan Vitamin (tanggal-bulan-tahun)",
                          icon: Icons.date_range_outlined,
                          control: controlTanggalAsupanVitamin,
                          validatorvalue: (value) {
                            if (value == null || value.isEmpty) {
                              return "Data wajib diisi";
                            }
                            return null;
                          }),
                      RoundedInputField(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          hinText: "Status",
                          icon: Icons.health_and_safety,
                          control: controlStatus,
                          validatorvalue: (value) {
                            if (value == null || value.isEmpty) {
                              return "Data wajib diisi";
                            }
                            return null;
                          }),
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
                                          JenisTernak: controlJenisTernak.text,
                                          NamaVitamin: controlNamaVitamin.text,
                                          TanggalAsupanVitamin:
                                              controlTanggalAsupanVitamin.text,
                                          Status: controlStatus.text);
                                      createData(data);
                                      controlID.text = '';
                                      controlJenisTernak.text = '';
                                      controlNamaVitamin.text = '';
                                      controlTanggalAsupanVitamin.text = '';
                                      controlStatus.text = '';
                                      Fluttertoast.showToast(
                                          msg: "Data Berhasil disimpan");
                                      Navigator.of(context).pop();
                                  },
                                  child: Text("Simpan",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)))),
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
                                          fontSize: 20, color: Colors.white))))
                        ],
                      ),
                    ],
                  ));
        },
        child: Icon(Icons.add),
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
                    child: Text(
                        "Tanggal Asupan Vitamin: " + data.TanggalAsupanVitamin),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child: Text("Nama Vitamin: " + data.NamaVitamin),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child: Text("Jenis Ternak: " + data.JenisTernak),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 10),
                    child: Text("Status: " + data.Status),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );

Stream<List<Data>> readData() => FirebaseFirestore.instance
    .collection("data_asupan_vitamin_hewan_ternak")
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());

Future createData(Data data) async {
  final docData = FirebaseFirestore.instance
      .collection("data_asupan_vitamin_hewan_ternak")
      .doc();
  data.ID = docData.id;
  final json = data.toJson();
  docData.set(json);
}
