import 'package:flutter/material.dart';
import 'data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:farm_o/components/components.dart';

class show_data extends StatefulWidget {
  const show_data({ Key? key }) : super(key: key);

  @override
  State<show_data> createState() => _show_dataState();
}

class _show_dataState extends State<show_data> {
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

class DataSource extends DataGridSource {
  DataSource(List<Data>datas){
    dataGridRows = datas
    .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: "ID", value: dataGridRow.ID),
      DataGridCell<String>(columnName: "Jenis Ternak", value: dataGridRow.JenisTernak),
      DataGridCell<int>(columnName: "Jumlah Pejantan", value: dataGridRow.Jumlah),
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