import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonTextFormField extends StatelessWidget {
  final bool obscureText;
  final String labelText;
  final IconData? suffixIcon;
  // controller for the TextFormField
  final TextEditingController controller;
  const ButtonTextFormField({
    super.key,
    required this.obscureText,
    required this.labelText,
    required this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.black38,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
        ),
      ),
      obscureText: obscureText, // For password fields
    );
  }
}
