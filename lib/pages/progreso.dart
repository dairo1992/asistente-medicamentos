import 'package:asistentemedicamentos/widgets/navigatorBar.dart';
import 'package:flutter/material.dart';

class ProgresoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TimePickerDialog(
            initialEntryMode: TimePickerEntryMode.input,
            initialTime: TimeOfDay.now(),
            onEntryModeChanged: (value) => print(value)),
      ),
      // bottomNavigationBar: NavigatorMenu()
    );
  }
}
