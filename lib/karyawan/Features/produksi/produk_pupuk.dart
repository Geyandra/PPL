import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_o/Features/produksi/data_produksi.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farm_o/components/components.dart';
import 'package:fluttertoast/fluttertoast.dart';

class produk_pupuk extends StatefulWidget {
  const produk_pupuk({Key? key}) : super(key: key);

  @override
  State<produk_pupuk> createState() => _produk_pupukState();
}

class _produk_pupukState extends State<produk_pupuk> {
  final controlID = TextEditingController();
  final controlJumlah = TextEditingController();
  final controlTanggalProduksi = TextEditingController();
  final controlJenisProduk = TextEditingController();

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
                          hinText: "Tanggal Produksi (tanggal-bulan-tahun)",
                          icon: Icons.date_range_outlined,
                          control: controlTanggalProduksi,
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
                                        JenisProduk: "Pupuk",
                                        Jumlah: int.parse(controlJumlah.text),
                                        TanggalProduksi:
                                            controlTanggalProduksi.text,
                                      );
                                      createData(data);
                                      controlID.text = '';
                                      controlJenisProduk.text = '';
                                      controlJumlah.text = '';
                                      controlTanggalProduksi.text = '';
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
        title: Text("Produksi Peternakan"),
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
                    child: Text("Tanggal Produksi: " + data.TanggalProduksi),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child: Text("Jenis Produk: " + data.JenisProduk),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                    child: Text("Jumlah Produk: " + '${data.Jumlah}'),
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
  final controlTanggalProduksi = TextEditingController();

  @override
  void initState() {
    controlID.text = widget.data.ID;
    controlJenisProduk.text = widget.data.JenisProduk;
    controlJumlah.text = widget.data.Jumlah.toString();
    controlTanggalProduksi.text = widget.data.TanggalProduksi;
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
                              controller: controlTanggalProduksi,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.date_range_outlined),
                                label: Text("Tanggal Produksi"),
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
                                        TanggalProduksi:
                                            controlTanggalProduksi.text,
                                      );
                                      updateData(data);
                                      controlJumlah.text = '';
                                      controlTanggalProduksi.text = '';
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
                                      controlTanggalProduksi.text = '';
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
    .collection("produksi_peternakan")
    .where('JenisProduk', isEqualTo: "Pupuk")
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());

Future createData(Data data) async {
  final docData =
      FirebaseFirestore.instance.collection("produksi_peternakan").doc();
  data.ID = docData.id;
  final json = data.toJson();
  docData.set(json);
}

Future updateData(Data data) async {
  final docData =
      FirebaseFirestore.instance.collection("produksi_peternakan").doc(data.ID);
  data.ID = docData.id;
  final json = data.toJson();
  docData.update(json);
}
