import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_o/Features/recording/data_penjualan.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farm_o/components/components.dart';
import 'package:fluttertoast/fluttertoast.dart';

class pupuk_mentah extends StatefulWidget {
  const pupuk_mentah({Key? key}) : super(key: key);

  @override
  State<pupuk_mentah> createState() => _pupuk_mentahState();
}

class _pupuk_mentahState extends State<pupuk_mentah> {
  final controlID = TextEditingController();
  final controlJumlah = TextEditingController();
  final controlTanggalPenjualan = TextEditingController();
  final controlJenisProduk = TextEditingController();
  final controlTotalPembayaran = TextEditingController();
  final controlMediaPembayaran = TextEditingController();

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
                          hinText: "Tanggal Penjualan (tanggal-bulan-tahun)",
                          icon: Icons.date_range_outlined,
                          control: controlTanggalPenjualan,
                        ),
                        RoundedInputField(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          hinText: "Total Pembayaran",
                          icon: Icons.attach_money,
                          control: controlTotalPembayaran,
                        ),
                        RoundedInputField(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          hinText: "Media Pembayaran",
                          icon: Icons.payment,
                          control: controlMediaPembayaran,
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
                                        JenisProduk: "Pupuk Mentah",
                                        Jumlah: int.parse(controlJumlah.text),
                                        TanggalPenjualan:
                                            controlTanggalPenjualan.text,
                                        TotalPembayaran: int.parse(
                                            controlTotalPembayaran.text),
                                        MediaPembayaran:
                                            controlMediaPembayaran.text,
                                      );
                                      createData(data);
                                      controlID.text = '';
                                      controlJenisProduk.text = '';
                                      controlJumlah.text = '';
                                      controlTanggalPenjualan.text = '';
                                      controlTotalPembayaran.text = '';
                                      controlMediaPembayaran.text = '';
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
                  "assets/fertilizer (1).png",
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
                    child: Text("Tanggal Penjualan: " + data.TanggalPenjualan),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child: Text("Jenis Produk: " + data.JenisProduk),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child: Text("Jumlah Produk: " + '${data.Jumlah}'),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child:
                        Text("Total Pembayaran: " + '${data.TotalPembayaran}'),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child: Text("Media Pembayaran: " + data.MediaPembayaran),
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
  final controlJenisProduk = TextEditingController();
  final controlJumlah = TextEditingController();
  final controlTanggalPenjualan = TextEditingController();
  final controlTotalPembayaran = TextEditingController();
  final controlMediaPembayaran = TextEditingController();

  @override
  void initState() {
    controlID.text = widget.data.ID;
    controlJenisProduk.text = widget.data.JenisProduk;
    controlJumlah.text = widget.data.Jumlah.toString();
    controlTanggalPenjualan.text = widget.data.TanggalPenjualan;
    controlTotalPembayaran.text = widget.data.TotalPembayaran.toString();
    controlMediaPembayaran.text = widget.data.MediaPembayaran;
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
                              controller: controlTanggalPenjualan,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.date_range_outlined),
                                label: Text("Tanggal Penjualan"),
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextField(
                              controller: controlTotalPembayaran,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.attach_money),
                                label: Text("Total Pembayaran"),
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextField(
                              controller: controlMediaPembayaran,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.payment),
                                label: Text("Media Pembayaran"),
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
                                          JenisProduk: widget.data.JenisProduk,
                                          Jumlah: int.parse(controlJumlah.text),
                                          TanggalPenjualan:
                                              controlTanggalPenjualan.text,
                                          TotalPembayaran: int.parse(
                                              controlTotalPembayaran.text),
                                          MediaPembayaran:
                                              controlMediaPembayaran.text);
                                      updateData(data);
                                      controlJumlah.text = '';
                                      controlTanggalPenjualan.text = '';
                                      controlTotalPembayaran.text = '';
                                      controlMediaPembayaran.text = '';
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
                                      controlTanggalPenjualan.text = '';
                                      controlTotalPembayaran.text = '';
                                      controlMediaPembayaran.text = '';
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
    .collection("recording_penjualan")
    .where('JenisProduk', isEqualTo: "Pupuk Mentah")
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());

Future createData(Data data) async {
  final docData =
      FirebaseFirestore.instance.collection("recording_penjualan").doc();
  data.ID = docData.id;
  final json = data.toJson();
  docData.set(json);
}

Future updateData(Data data) async {
  final docData =
      FirebaseFirestore.instance.collection("recording_penjualan").doc(data.ID);
  data.ID = docData.id;
  final json = data.toJson();
  docData.update(json);
}
