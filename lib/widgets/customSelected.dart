import 'package:asistentemedicamentos/providers/serviceProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSelect extends StatelessWidget {
  const CustomSelect({
    super.key,
    required this.fieldName,
    this.keyboardType,
    this.obscureText = false,
    this.icon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.borderColor = Colors.blueAccent,
    this.colorField = Colors.deepPurpleAccent,
    required this.opciones,
    required this.value,
    required this.controller,
  });

  final List opciones;
  final int value;
  final TextEditingController controller;
  final String fieldName;
  final IconData icon;
  final Color prefixIconColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color borderColor;
  final Color colorField;

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ServicesProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonFormField<int>(
          validator: (value) {
            if (value == null ||
                value.isNaN ||
                value.isNegative ||
                value == 0) {
              return "Debe seleccionar una opcion valida";
            } else {
              return null;
            }
          },
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          items: opciones
              .map<DropdownMenuItem<int>>((value) => DropdownMenuItem<int>(
                    value: value['id'],
                    child: Text(value['name']),
                  ))
              .toList(),
          value: service.opcionSeleccionada,
          onChanged: (value) async {
            if (value == 1) {
              service.getmedicinas();
            }
            service.opcionSeleccionada = value!;
            controller.text = value.toString();
          },
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
              labelStyle: TextStyle(color: colorField))),
    );
  }
}
