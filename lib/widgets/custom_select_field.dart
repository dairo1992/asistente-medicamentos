import 'package:flutter/material.dart';

class CustomSelectField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final String? initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? colorBorder;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomSelectField({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.initialValue,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
    formValue,
    this.colorBorder = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 3,
            color: colorBorder!,
          ),
        ),
        suffixIcon: Icon(suffixIcon),
      ),
      value: '0',
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            value: '0', child: Text('Seleccionar'), enabled: false),
        DropdownMenuItem<String>(value: '1', child: Text('Medicamento')),
        DropdownMenuItem<String>(value: '2', child: Text('Cita medica')),
        DropdownMenuItem<String>(value: '3', child: Text('Otro')),
      ],
      onChanged: (value) {
        formValues[formProperty] = value!;
      },
      validator: (value) {
        if (value == null) {
          return 'Este campo es requerido';
        }
        if (value == '0') {
          return 'Debe seleccionar una opcion';
        }
        return null;
      },
    );
  }
}
