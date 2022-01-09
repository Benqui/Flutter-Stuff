import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:meta/meta.dart';

class ScanModel {
  int? id;
  String? tipo;
  String valor;

  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    if (valor.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  LatLng getLatLng() {
    // final latLng = this.valor.substring(4).split(',');
    final latLng = this.valor.split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);

    print('$lat \n$lng');

    return LatLng(lat, lng);
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