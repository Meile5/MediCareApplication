import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PairScreen extends StatefulWidget {
  const PairScreen({Key? key}) : super(key: key);

  @override
  State<PairScreen> createState() => _PairScreenState();
}

class _PairScreenState extends State<PairScreen> {
  List<ScanResult> scanResults = [];
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  Future<void> _startScan() async {
    final status = await Permission.bluetoothScan.request();
    if (!status.isGranted) return;

    setState(() {
      isScanning = true;
      scanResults = [];
    });

    FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        scanResults = results;
      });
    });

    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    setState(() {
      isScanning = false;
    });
  }

  void _onDeviceSelected(BluetoothDevice device) async {
    await FlutterBluePlus.stopScan();

    await device.connect();
    Navigator.pop(context, device);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pair Device')),
      body:
          isScanning
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                itemCount: scanResults.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final result = scanResults[index];
                  final device = result.device;
                  final name =
                      device.name.isNotEmpty ? device.name : "Unknown Device";

                  return ListTile(
                    leading: const Icon(Icons.bluetooth),
                    title: Text(name),
                    subtitle: Text(device.id.toString()),
                    onTap: () => _onDeviceSelected(device),
                  );
                },
              ),
    );
  }
}
