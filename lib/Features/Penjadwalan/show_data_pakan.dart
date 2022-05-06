import 'package:flutter/material.dart';
import 'datapakan.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:farm_o/components/components.dart';

class show_data_pakan extends StatefulWidget {
  const show_data_pakan({ Key? key }) : super(key: key);

  @override
  State<show_data_pakan> createState() => _show_data_pakanState();
}

class _show_data_pakanState extends State<show_data_pakan> {
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
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "ID", icon: Icons.format_list_numbered, ),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Jenis Ternak", icon: Icons.pets, ),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Hari Pakan", icon: Icons.view_day, ),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Tanggal Pakan", icon: Icons.date_range_outlined, ),
            RoundedInputField(screenWidth: screenWidth, screenHeight: screenHeight, hinText: "Status", icon: Icons.health_and_safety, ),
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
                  child: TextButton(onPressed: () {}, child: Text("Simpan", style: TextStyle(fontSize: 20, color: Colors.black)))),
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
        title: Text("Jadwal Pakan Hewan Ternak")
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
              columnName: 'Hari Pakan',
              label: Container(
                // color: Colors.blue,
                // margin: EdgeInsets.symmetric(horizontal: 1),
                // padding: EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                child: Text(
                  'Hari Pakan',
                  // overflow: TextOverflow.ellipsis,
                ),
              )),
              GridTextColumn(
                // width: screenWidth/6,
              columnName: 'Tanggal Pakan',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 1),
                alignment: Alignment.center,
                child: Text(
                  'Tanggal Pakan',
                  // overflow: TextOverflow.ellipsis,
                ),
              )),
              GridTextColumn(
                // width: screenWidth/6,
              columnName: 'Status',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 1),
                alignment: Alignment.center,
                child: Text(
                  'Status',
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

class DataSource extends DataGridSource {
  DataSource(List<Data>datas){
    dataGridRows = datas
    .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<int>(columnName: "ID", value: dataGridRow.ID),
      DataGridCell<String>(columnName: "Jenis Ternak", value: dataGridRow.JenisTernak),
      DataGridCell<String>(columnName: "Hari Pakan", value: dataGridRow.HariPakan),
      DataGridCell<String>(columnName: "Tanggal Pakan", value: dataGridRow.TanggalPakan),
      DataGridCell<String>(columnName: "Status", value: dataGridRow.Status),
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