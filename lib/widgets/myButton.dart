import 'package:flutter/material.dart';
import 'package:rental_travel_app/core/constants/RadiusConst.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onpressed;
  final Color primaryColor;
  final double width;
  final double height;
  final String text;
  const MyButton(
      {required this.text, this.height = 60, this.width = 330,this.primaryColor = ColorConst.kPrimaryColor,
      required this.onpressed,
      Key? key})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          shadowColor: ColorConst.black,
          elevation: 10,
          primary: primaryColor,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusConst.medium),
          )),
      child: Text(text),
    );
  }
}
