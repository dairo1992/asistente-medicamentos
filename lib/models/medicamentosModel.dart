// To parse this JSON data, do
//
//     final medicamento = medicamentoFromJson(jsonString);

import 'dart:convert';

Medicamento medicamentoFromJson(String str) =>
    Medicamento.fromJson(json.decode(str));

String medicamentoToJson(Medicamento data) => json.encode(data.toJson());

class Medicamento {
  int? idMedicina;
  int idTipo;
  int frecuencia;
  String hora;
  int recordarme;
  int cantidad;
  int estado;

  Medicamento({
    this.idMedicina,
    required this.idTipo,
    required this.frecuencia,
    required this.hora,
    required this.recordarme,
    required this.cantidad,
    required this.estado,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) => Medicamento(
        idMedicina: json["ID_MEDICINA"],
        idTipo: json["ID_TIPO"],
        frecuencia: json["FRECUENCIA"],
        hora: json["HORA"],
        recordarme: json["RECORDARME"],
        cantidad: json["CANTIDAD"],
        estado: json["ESTADO"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "ID_MEDICINA": idMedicina,
        "ID_TIPO": idTipo,
        "FRECUENCIA": frecuencia,
        "HORA": hora,
        "RECORDARME": recordarme,
        "CANTIDAD": cantidad,
        "ESTADO": estado,
      };
}
