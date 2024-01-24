// To parse this JSON data, do
//
//     final medicina = medicinaFromJson(jsonString);

import 'dart:convert';

List<Medicina> medicinaFromJson(String str) =>
    List<Medicina>.from(json.decode(str).map((x) => Medicina.fromJson(x)));

String medicinaToJson(List<Medicina> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medicina {
  int? id;
  String descripcion;
  String composicion;
  String formaFarmaceutica;
  int estado;

  Medicina({
    this.id,
    required this.descripcion,
    required this.composicion,
    required this.formaFarmaceutica,
    required this.estado,
  });

  factory Medicina.fromJson(Map<String, dynamic> json) => Medicina(
      id: json["ID"],
      descripcion: json["DESCRIPCION"],
      composicion: json["COMPOSICION"],
      formaFarmaceutica: json["FORMAFARMACEUTICA"],
      estado: json["ESTADO"]);

  Map<String, dynamic> toJson() => {
        "ID": id,
        "DESCRIPCION": descripcion,
        "COMPOSICION": composicion,
        "FORMAFARMACEUTICA": formaFarmaceutica,
        "ESTADO": estado
      };
}
