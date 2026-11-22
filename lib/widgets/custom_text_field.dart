import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Icon suffixIcon;
  final String label;
  bool obscureText;
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.suffixIcon,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter This field';
        } else if (label == "Email" && !value.contains('@gmail.com')) {
          return 'Please Enter a valid Email';
        } else if (label == "Password" && !(value.length < 8)) {
          return 'Please Enter a password not less than 8 characters';
        } else if (label == "phone" && !(value.length < 11)) {
          return 'Please Enter a phone of only 11 numbers';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(label),
        border: OutlineInputBorder(),
      ),
    );
  }
}
