import 'package:asistentemedicamentos/models/medicina.dart';
import 'package:asistentemedicamentos/providers/serviceProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectMedicinas extends StatelessWidget {
  const SelectMedicinas({
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

  final List<Medicina> opciones;
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          items: opciones
              .map<DropdownMenuItem<int>>((value) => DropdownMenuItem<int>(
                    value: value.id,
                    child: SizedBox(
                      width: 240,
                      child: Text(value.descripcion,
                          softWrap: true, overflow: TextOverflow.ellipsis),
                    ),
                  ))
              .toList(),
          value: service.opcionMedicinaSeleccionada,
          onChanged: (value) async {
            service.opcionMedicinaSeleccionada = value!;
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
