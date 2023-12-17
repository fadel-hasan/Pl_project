import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text, required this.width, required this.height});
  String text;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1DC2D6),
        borderRadius: BorderRadius.circular(8),
      ),
      width: width,
      height: height,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
