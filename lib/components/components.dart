import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hinText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.hinText,
    required this.onChanged,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(screenWidth: screenWidth, screenHeight: screenHeight,
     child: TextField(
       onChanged: onChanged,
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
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.screenWidth,
    required this.screenHeight, 
    required this.hinText, 
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      screenWidth: screenWidth, 
      screenHeight: screenHeight, 
    child: TextField(
      onChanged: onChanged,
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
