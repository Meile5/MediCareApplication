import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/vitals/state/vitals_cubit.dart';

class PairScreen extends StatefulWidget {
  const PairScreen({Key? key}) : super(key: key);

  @override
  State<PairScreen> createState() => _PairScreenState();
}

class _PairScreenState extends State<PairScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isPairing = false;
  String? _error;

  Future<void> _pairDevice(BuildContext context) async {
    setState(() {
      _isPairing = true;
      _error = null;
    });

    try {
      final deviceId = await context.read<VitalsCubit>().pairDevice(
        _codeController.text.trim(),
      );

      // Show a confirmation message
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Paired with device: $deviceId")));

      // Navigate to overview screen
      Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _error = "Failed to pair device.";
      });
    } finally {
      setState(() {
        _isPairing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pair Device")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Enter the pairing code provided by your device:"),
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: "Pairing Code"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isPairing ? null : () => _pairDevice(context),
              child:
                  _isPairing ? CircularProgressIndicator() : const Text("Pair"),
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!, style: const TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}
