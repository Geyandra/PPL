import 'package:farm_o/Features/Populasi/data.dart';
import 'package:flutter/material.dart';

import '../Features/Populasi/demo.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hinText;
  final control;
  const RoundedPasswordField({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.hinText,
    this.control,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(screenWidth: screenWidth, screenHeight: screenHeight,
     child: TextField(
       controller: control,
       obscureText: true,
       decoration: InputDecoration(
         hintText: hinText,
         icon: Icon(Icons.lock_outline_sharp, color: Colors.black,),
         suffixIcon: Icon(Icons.visibility, color: Colors.black,),
         border: InputBorder.none
       ),
     ));
  }
}

class RoundedInputField extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final control;
  const RoundedInputField({
    Key? key,
    required this.screenWidth,
    required this.screenHeight, 
    required this.hinText, 
    required this.icon,
    this.control,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      screenWidth: screenWidth, 
      screenHeight: screenHeight, 
    child: TextField(
      controller: control,
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hinText,
        border: InputBorder.none,
      ),
    ),);
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.screenWidth,
    required this.screenHeight, 
    required this.child,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight/100),
      padding: EdgeInsets.symmetric(horizontal:screenWidth*0.01),
      width: screenWidth/3,
      height: screenHeight*0.05,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: child,
    );
  }
}

class ButtonOnDialog extends StatelessWidget {
  final dynamic insertpadding;
  final dynamic insertmargin;
  final dynamic color;
  final dynamic colortext;
  final dynamic sizetext;
  final String title;
  const ButtonOnDialog({
    Key? key, 
    this.insertpadding,
    this.insertmargin,
    this.color,
    this.colortext,
    this.sizetext,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: insertpadding,
          margin: insertmargin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          child: TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text(title, style: TextStyle(fontSize: sizetext, color: colortext))),
        ),
      ],
    );
  }
}
class UpdateOnDialog extends StatelessWidget {
  final controlID = TextEditingController();
  final controlJenisTernak = TextEditingController();
  final controlJumlah = TextEditingController();
  final controlTanggalPendataan = TextEditingController();
  final controlKesehatanTernak = TextEditingController();
  final dynamic insertpadding;
  final dynamic insertmargin;
  final dynamic color;
  final dynamic colortext;
  final dynamic sizetext;
  final String title;
   UpdateOnDialog({
    Key? key, 
    this.insertpadding,
    this.insertmargin,
    this.color,
    this.colortext,
    this.sizetext,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          padding: insertpadding,
          margin: insertmargin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          child: TextButton(onPressed: () {
            Navigator.of(context).pop();
            showDialog(context: context, builder: (context) => SimpleDialog(
          title: Text("Update Data"),
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
                      updateData(data);
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
                  child: TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Batalkan", style: TextStyle(fontSize: 20, color: Colors.white)))
                  )
              ],
            ),
          ],
        ));
            Navigator.of(context).pop();}, child: Text(title, style: TextStyle(fontSize: sizetext, color: colortext))),
        ),
      ],
    );
  }
}
class InkWellCard extends StatelessWidget {
  final String text;
  final String texttgl;
  final Widget dialog;
  const InkWellCard({
    Key? key,
    required this.text,
    required this.texttgl,
    required this.dialog
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return InkWell(
      hoverColor: Colors.greenAccent,
      onDoubleTap:  () {showDialog(context: context, builder: (context) => dialog);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/fbg3.png", width: 80,),
          ),
          Column(
            children: [
              Container(
                // color: Colors.blue,
                padding: EdgeInsets.fromLTRB(40, 10, 29, 10),
                // margin: EdgeInsets.all(10),
                child: Text(text),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(33, 0, 10, 0),
                child: Text(texttgl),
              )
            ],
          ),
        ],
      ),
    );
  }
} 
