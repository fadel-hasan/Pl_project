import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText, this.obscureText, this.controller});
  String? hintText;
  bool? obscureText;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      obscureText: obscureText!,
      controller: controller,
    );
  }
}
