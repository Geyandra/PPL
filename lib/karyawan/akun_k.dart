import 'package:farm_o/karyawan/acc_k.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class dataAkun_k extends StatefulWidget {
  const dataAkun_k({ Key? key }) : super(key: key);

  @override
  State<dataAkun_k> createState() => _dataAkun_kState();
}

class _dataAkun_kState extends State<dataAkun_k> {

  @override
  Widget build(BuildContext context ) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Akun"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/fbg2.jpg"),
          fit: BoxFit.cover
          ),
        ),
        child: Stack(
          children: [
            Center(
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
          ],
        ),
      ),
    );
  }
}

Widget buildData(Data data) => Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Container(
      padding: EdgeInsets.symmetric(vertical: 140),
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      color: Colors.green.shade100,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 400, vertical: 10),
              color: Colors.white,
              child: ElevatedButton(onPressed: null, child: Text(data.Email),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(400, 30)
              ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 400, vertical: 10),
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person),
                  hintText: "Nama Depan",
                  label: Text(data.FirstName),
                  labelStyle: TextStyle(
                    fontSize: 24,
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 400, vertical: 10),
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person),
                  hintText: "Nama Belakang",
                  label: Text(data.LastName),
                  labelStyle: TextStyle(
                    fontSize: 24,
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 400, vertical: 10),
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.phone_android),
                  hintText: "Nomor Telepon",
                  label: Text("${data.PhoneNumber}"),
                  labelStyle: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            update(data: data,)
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
  final controlFirstName = TextEditingController();

  final controlLastName = TextEditingController();

  final controlPhoneNumber = TextEditingController();

  @override
  void initState() {
    controlFirstName.text = widget.data.FirstName;
    controlLastName.text = widget.data.LastName;
    controlPhoneNumber.text = widget.data.PhoneNumber.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 600, vertical: 10),
      child: ElevatedButton(onPressed: (){
        showDialog(context: context, builder: (context) => SimpleDialog(
          backgroundColor: Colors.green.shade100,
          contentPadding: EdgeInsets.all(10),
          children: [
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: TextField(
                controller: controlFirstName,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person),
                  label: Text("First Name"),
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: TextField(
                controller: controlLastName,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person),
                  label: Text("Last Name"),
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: TextField(
                controller: controlPhoneNumber,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.phone_android),
                  label: Text("Phone Number"),
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
                    borderRadius: BorderRadius.circular(30)
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(onPressed: (){
                    final data = Data(
                      ID: widget.data.ID,
                      Email: widget.data.Email,
                      FirstName: controlFirstName.text, 
                      LastName: controlLastName.text, 
                      PhoneNumber: int.parse(controlPhoneNumber.text),
                      );
                      updateData(data);
                      controlFirstName.text = '';
                      controlLastName.text = '';
                      controlPhoneNumber.text = '';
                      Navigator.of(context).pop();
                  }, child: Text("Simpan", style: TextStyle(fontSize: 20, color: Colors.black))
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Batal", style: TextStyle(fontSize: 20, color: Colors.white))
                  ),
                )
              ],
            )
          ],
        ));
      }, child: Text("Update"),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(400, 70)
      ),),
    );
  }
}


Stream<List<Data>> readData() => FirebaseFirestore.instance.collection("Akun_Karyawan").where("Email", isEqualTo:
FirebaseAuth.instance.currentUser!.email!
)
.snapshots().map((snapshots)=> 
snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());

Future updateData (Data data) async {
  final docData = FirebaseFirestore.instance.collection("Akun_Karyawan").doc(data.ID);
  data.ID = docData.id;
  final json = data.toJson();
  docData.update(json);}

