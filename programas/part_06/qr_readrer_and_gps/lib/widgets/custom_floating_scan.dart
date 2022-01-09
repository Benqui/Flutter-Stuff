import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_readrer_and_gps/providers/scan_list_provider.dart';
import 'package:qr_readrer_and_gps/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancel', false, ScanMode.QR);
        // String barcodeScanRes = 'https://www.youtube.com/';

        // String barcodeScanRes = '19.437293367701262,-99.14356236417174';
        if (barcodeScanRes == '-1') {
          return;
        }
        final scanlistprovider =
            Provider.of<ScanListProvider>(context, listen: false);

        final newScan = await scanlistprovider.nuevoScan(barcodeScanRes);

        launchURL(context, newScan);
      },
      child: const Icon(Icons.qr_code_2_outlined, size: 30),
    );
  }
}
