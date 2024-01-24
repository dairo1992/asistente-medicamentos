import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatelessWidget {
  final TextEditingController controller;
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
  String value;

  CustomDateField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.initialValue,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    formValue,
    this.colorBorder = Colors.blueGrey,
    required this.controller,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd HH:mm");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: DateTimeField(
        // validator: (value) {
        //   if (value == null || value == '') {
        //     return "Debe diligenciar este campo";
        //   } else {
        //     return null;
        //   }
        // },
        format: format,
        controller: controller,
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
          suffixIcon: const Icon(Icons.calendar_month),
        ),
        onShowPicker: (context, currentValue) async {
          try {
            return await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100),
            ).then((DateTime? date) async {
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                // formValues[formProperty] =
                //     DateTimeField.combine(date, time).toString();
                value = DateTimeField.combine(date, time).toString();
                return DateTimeField.combine(date, time);
              } else {
                return currentValue;
              }
            });
          } catch (e) {
            return null;
          }
        },
      ),
    );
  }
}
