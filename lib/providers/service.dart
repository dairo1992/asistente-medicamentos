import 'package:asistentemedicamentos/models/medicamentosModel.dart';
import 'package:asistentemedicamentos/models/medicina.dart';
import 'package:asistentemedicamentos/providers/db_provider.dart';
import 'package:flutter/material.dart';

class Services with ChangeNotifier {
  List<Medicina> _medicinas = [];
  TextEditingController _timeInput = TextEditingController();
  bool _recordar = false;
  List<Medicamento> formValues = [];

  // List<Medicamento> get formValues => _formValues;

  // set formValues(Medicamento med) {
  //   _formValues.add(med);
  //   notifyListeners();
  // }

  bool get recordar => _recordar;

  set recordar(bool value) {
    _recordar = value;
    notifyListeners();
  }

  MaterialStateProperty<Icon?> _thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  MaterialStateProperty<Icon?> get thumbIcon => _thumbIcon;

  set thumbIcon(MaterialStateProperty<Icon?> val) {
    _thumbIcon = val;
    notifyListeners();
  }

  List<Medicina> get medicinas => _medicinas;

  Future<Medicina> nuevaMedicina(Medicina med) async {
    final nuevaMed = med;
    final id = await DBProvider.db.nuevaMedicina(nuevaMed);
    nuevaMed.id = id;
    await DBProvider.db.nuevaMedicina(nuevaMed);
    _medicinas.add(nuevaMed);
    notifyListeners();
    return nuevaMed;
  }

  TextEditingController get timeInput => _timeInput;

  set timeInput(value) {
    _timeInput = value;
    notifyListeners();
  }

  Future getmedicinas() async {
    final scans = await DBProvider.db.getMedicinas();
    _medicinas = [...scans];
    notifyListeners();
  }

  Future eliminarRegistros() async {
    await DBProvider.db.vaciarTabla();
  }
}
