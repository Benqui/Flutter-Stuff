import 'package:flutter/material.dart';
import 'package:qr_readrer_and_gps/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //asignar el id de la  base de datos al modelo
    nuevoScan.id = id;
    if (typeSelected == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  cargarScansByType(String tipo) async {
    final scans = await DBProvider.db.getScansByType(tipo);
    this.scans = [...scans!];
    typeSelected = tipo;
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    final scans = await DBProvider.db.deleteScan(id);
    this.cargarScansByType(this.typeSelected);
    // notifyListeners();
  }
}
