import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  Icon suffixIcon;
  String label;
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
