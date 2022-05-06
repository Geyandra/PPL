import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:farm_o/components/components.dart';
import 'package:firebase_core/firebase_core.dart';

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
  late List<Data>datas;
  late DataSource _dataSource;
  @override
  void initState() {
    datas = Data.getData();
    _dataSource = DataSource(datas);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference datass = firestore.collection('populasi_hewan_ternak');

    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {showDialog(context: context, builder: (context) => SimpleDialog(
          title: Text("Tambah Data"),
          backgroundColor: Colors.green,
          // contentPadding: EdgeInsets.symmetric(horizontal: screenWidth-(screenWidth*0.1), vertical: screenHeight-(screenHeight*0.1),),
          contentPadding: EdgeInsets.all(screenWidth*0.05),
          children: [
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
                    print("data masuk");

                    // datass.add({
                    //   "ID" : controlID.text,
                    //   "JenisTernak" : controlJenisTernak.text,
                    //   "Jumlah" : int.parse(controlJumlah.text),
                    //   "TanggalPendataan" : controlTanggalPendata'an.text,
                    //   "KesehatanTernak" : controlKesehatanTernak.text,});
                    final data = Data(
                      ID: controlID.text, 
                      JenisTernak: controlJenisTernak.text, 
                      Jumlah: int.parse(controlJumlah.text), 
                      TanggalPendataan: controlTanggalPendataan.text, 
                      KesehatanTernak: controlKesehatanTernak.text);
                      createData(data);

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
        ));},
        child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text("Data Populasi Hewan Ternak"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: 
        SfDataGrid(
          onCellDoubleTap: (details) { },
          columnWidthMode: ColumnWidthMode.fill,
          allowSorting: true,
          selectionMode: SelectionMode.single,
          source: _dataSource,
          columns: [
            GridTextColumn(
              // width: screenWidth/6,
              columnName: 'ID',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                // color: Colors.blue,
                child: Text(
                  'ID',
                  // overflow: TextOverflow.ellipsis,
                ),
              )),
              GridTextColumn(
                // width: screenWidth/6,
              columnName: 'Jenis Ternak',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 1),
                alignment: Alignment.center,
                child: Text(
                  'Jenis Ternak',
                  // overflow: TextOverflow.ellipsis,
                ),
              )),
              GridTextColumn(
                // width: screenWidth/6,
              columnName: 'Jumlah',
              label: Container(
                // color: Colors.blue,
                // margin: EdgeInsets.symmetric(horizontal: 1),
                // padding: EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                child: Text(
                  'Jumlah',
                  // overflow: TextOverflow.ellipsis,
                ),
              )),
              GridTextColumn(
                // width: screenWidth/6,
              columnName: 'Tanggal Pendataan',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 1),
                alignment: Alignment.center,
                child: Text(
                  'Tanggal Pendataan',
                  // overflow: TextOverflow.ellipsis,
                ),
              )),
              GridTextColumn(
                // width: screenWidth/6,
              columnName: 'Kesehatan Ternak',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 1),
                alignment: Alignment.center,
                child: Text(
                  'Kesehatan Ternak',
                  // overflow: TextOverflow.ellipsis,
                ),
              )),
          ],
        ),
        ),
      ),
    );
  }
}

Future createData (Data data) async {
  final docData = FirebaseFirestore.instance.collection("populasi_hewan_ternak").doc();
  data.ID = docData.id;
  final json = data.toJson();
  await docData.set(json);
}

class DataSource extends DataGridSource {
  DataSource(List<Data>datas){
    dataGridRows = datas
    .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: "ID", value: dataGridRow.ID),
      DataGridCell<String>(columnName: "Jenis Ternak", value: dataGridRow.JenisTernak),
      DataGridCell<int>(columnName: "Jumlah", value: dataGridRow.Jumlah),
      DataGridCell<String>(columnName: "Tanggal Pendataan", value: dataGridRow.TanggalPendataan),
      DataGridCell<String>(columnName: "Kesehatan Ternak", value: dataGridRow.KesehatanTernak),
    ])).toList();
  }

  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows; 

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}