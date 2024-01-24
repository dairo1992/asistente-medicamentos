import 'package:asistentemedicamentos/models/medicamentosModel.dart';
import 'package:asistentemedicamentos/models/medicina.dart';
import 'package:asistentemedicamentos/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ServicesProvider with ChangeNotifier {
  TextEditingController idTipoController = TextEditingController();
  TextEditingController frecuenciaController = TextEditingController();
  TextEditingController horaController = TextEditingController();
  TextEditingController recordarmeController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  TextEditingController medicinaController = TextEditingController();
  TextEditingController estadoController = TextEditingController();

  List<Medicina> _medicinas = [];
  List<Medicamento> _medicamentos = [];
  List<Medicina> get medicinas => _medicinas;
  List<Medicamento> get medicamentos => _medicamentos;
  final List<Map<String, dynamic>> opciones = [
    {'id': 0, 'name': 'Seleccionar'},
    {'id': 1, 'name': 'Medicamento'},
    {'id': 2, 'name': 'Cita Medicina'},
  ];
  int _opcionSeleccionada = 0;
  int _opcionMedicinaSeleccionada = 1;
  int get opcionSeleccionada => _opcionSeleccionada;
  set opcionSeleccionada(int val) {
    _opcionSeleccionada = val;
    notifyListeners();
  }

  int get opcionMedicinaSeleccionada => _opcionMedicinaSeleccionada;
  set opcionMedicinaSeleccionada(int val) {
    _opcionMedicinaSeleccionada = val;
    notifyListeners();
  }

  bool _swRecordar = false;

  bool get swRecordar => _swRecordar;

  set swRecordar(bool val) {
    _swRecordar = val;
    notifyListeners();
  }

  Future getmedicinas() async {
    final scans = await DBProvider.db.getMedicinas();
    _medicinas = [...scans];
    print(_medicinas);
    notifyListeners();
  }

  Future<bool> nuevoMedicamento(Medicamento med) async {
    await DBProvider.db.nuevaMedicamento(med);
    medicamentos.add(med);
    notifyListeners();
    return true;
  }

  // Future llenarTabla() async {
  //   await DBProvider.db.llenarMedicinas();
  // }
}
