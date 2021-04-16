import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_providers.dart';
import 'package:qr_app/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({@required this.tipo});
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(
      context,
    );
    final scan = scanListProvider.scans;

    return ListView.builder(
        itemCount: scan.length,
        // itemCount: 10,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarScanPorId(scan[i].id);
              },
              child: ListTile(
                leading: Icon(
                    this.tipo == 'http'
                        ? Icons.home_outlined
                        : Icons.map_outlined,
                    color: Theme.of(context).primaryColor),
                title: Text(scan[i].valor),
                // title: Text('http://asmaalkxla'),
                subtitle: Text(scan[i].id.toString()),
                //  subtitle: Text('id:1'),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => launchURL(context, scan[i]),
              ),
            ));
  }
}
