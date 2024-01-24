import 'package:asistentemedicamentos/models/medicina.dart';
import 'package:asistentemedicamentos/providers/serviceProvider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectMedicina extends StatelessWidget {
  const SelectMedicina({
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
        padding: const EdgeInsets.all(8.0),
        child: DropdownSearch<Medicina>(
          dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
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
          items: service.medicinas,
          itemAsString: (Medicina med) => med.descripcion,
          onChanged: (value) {
            print(value!.estado);
          },
          popupProps: const PopupProps.menu(
            showSearchBox: true,
            title: Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Medicinas',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )),
          ),
        ));
  }
}
