import 'package:farm_o/Features/Populasi/data.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hinText;
  final control;
  final validatorvalue;
  const RoundedPasswordField({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.hinText,
    this.control,
    this.validatorvalue
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight*0.08,
      child: TextFieldContainer(screenWidth: screenWidth, screenHeight: screenHeight,
       child: TextFormField(
         validator: validatorvalue,
         keyboardType: TextInputType.text,
         controller: control,
         obscureText: true,
         decoration: InputDecoration(
           hintText: hinText,
           icon: Icon(Icons.key_sharp),
           border: InputBorder.none
         ),
       )),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final control;
  final dynamic textinputtype;
  final validatorvalue;
  final screenWidth;
  final screenHeight;
  const RoundedInputField({
    Key? key,
    this.screenWidth,
    this.screenHeight, 
    required this.hinText, 
    required this.icon,
    this.control,
    this.textinputtype,
    this.validatorvalue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight*0.08,
      child: TextFieldContainer(
        screenWidth: screenWidth, 
        screenHeight: screenHeight, 
      child: TextFormField(
        validator: validatorvalue,
        keyboardType: textinputtype,
        controller: control,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hinText,
          border: InputBorder.none,
        ),
      ),),
    );
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
