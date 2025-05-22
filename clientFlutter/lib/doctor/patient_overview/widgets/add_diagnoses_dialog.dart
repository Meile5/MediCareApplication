import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/auth/auth_prefs.dart';
import '../../../errorHandling/application_messages.dart';
import '../models/patients_overview_models.dart';
import '../state/patients_diagnoses_cubit.dart';
class DiagnosesDialog extends StatefulWidget {
  final String patientId;


  const DiagnosesDialog({
    super.key,
    required this.patientId,
  });
  @override
  _DiagnosesDialogState createState() => _DiagnosesDialogState();
}

class _DiagnosesDialogState extends State<DiagnosesDialog> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerTreatment = TextEditingController();

  String? _errorMessage;
  bool _isLoading = false;


  @override
  void dispose() {
    _controller.dispose(); // Cleans up the controller when the widget is disposed.
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final newDiagnosisDto = NewDiagnosisDto(
      patientDiagnosis: _controller.text,
      patientId: widget.patientId,
      treatment: _controllerTreatment.text,
      doctorId: AuthPrefs.userId!,
    );

    try {
      await context.read<DiagnosesCubit>().saveDiagnosis(newDiagnosisDto);
      if (context.mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() {
        _errorMessage = ApplicationMessages.generalError.message;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Diagnosis"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
                hintText: "Enter diagnosis"),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _controllerTreatment,
            decoration: const InputDecoration(
                hintText: "Enter treatment"),
          ),
          if (_errorMessage != null) ...[
            const SizedBox(height: 12),
            Text(_errorMessage!, style: TextStyle(color: Colors.red)),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_controller.text.isNotEmpty && _controllerTreatment.text.isNotEmpty) {
              if (!_isLoading) {
                await _submit();
              }

            }
            else{
              setState(() {
                _errorMessage = "Please fill in all fields";
              });
            }
          },
          child: _isLoading
              ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text("Confirm"),
        ),
      ],
    );
  }

 }

