import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_readrer_and_gps/providers/scan_list_provider.dart';
import 'package:qr_readrer_and_gps/utils/utils.dart';

class MapasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanlistprovider = Provider.of<ScanListProvider>(context);
    final scans = scanlistprovider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => ListTile(
        leading: const Icon(Icons.map),
        title: Text(scans[index].valor),
        subtitle: Text(scans[index].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () => launchURL(context, scans[index]),
      ),
    );
  }
}
