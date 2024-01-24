import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String fieldName;
  final IconData icon;
  final Color prefixIconColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color borderColor;
  final Color colorField;

  const Input({
    super.key,
    required this.controller,
    required this.fieldName,
    this.keyboardType,
    this.obscureText = false,
    this.icon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.borderColor = Colors.blueAccent,
    this.colorField = Colors.deepPurpleAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Debe diligenciar este campo";
          } else {
            return null;
          }
        },
        textCapitalization: TextCapitalization.words,
        autofocus: false,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            hintText: fieldName,
            labelText: fieldName,
            prefixIcon: Icon(icon, color: prefixIconColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 3,
                style: BorderStyle.solid,
                color: borderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 3,
                color: borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 3, color: borderColor)),
            labelStyle: TextStyle(color: colorField)),
      ),
    );
  }
}
