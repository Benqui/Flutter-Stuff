import 'dart:convert';
import 'package:meta/meta.dart';

class ScanModel {
  int id;
  String tipo;
  String valor;

  ScanModel({
    required this.id,
    required this.tipo,
    required this.valor,
  }) {
    if (tipo.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
//TODO: hacer a mi perro un nft y a tu abuela tambien xD