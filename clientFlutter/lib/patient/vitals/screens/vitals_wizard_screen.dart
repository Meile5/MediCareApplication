import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/auth/auth_prefs.dart';
import 'package:medicare/common/vitals/state/vitals_cubit.dart';
import 'package:medicare/patient/vitals/models/vitals_models.dart';
import '../utils/vitals_data_source.dart';
import '../widgets/ecg_step.dart';
import '../widgets/finger_sensor_step.dart';
import '../widgets/temperature_step.dart';

class VitalsWizardScreen extends StatefulWidget {
  @override
  _VitalsWizardScreenState createState() => _VitalsWizardScreenState();
}

class _VitalsWizardScreenState extends State<VitalsWizardScreen> {
  int _step = 0;
  double? _temperature;
  List<int> _ecgSamples = [];
  int? _heartRate = 75;
  double? _oxygenLevel = 97.0;
  bool _electrodesReady = false;

  void _nextStep() => setState(() => _step++);

  void _saveVitals() async {
    if (_temperature == null || _heartRate == null || _oxygenLevel == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please complete all measurements before saving.'),
        ),
      );
      return;
    }

    final vitals = SaveVitalsDto(
      PatientId: AuthPrefs.userId!,
      Temperature: _temperature!,
      OxygenLevel: _oxygenLevel!,
      Ecg: _ecgSamples,
      HeartRate: _heartRate!,
    );

    try {
      await VitalsDataSource().saveVitals(vitals);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Vitals saved successfully!')));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to save vitals: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<VitalsCubit>().state;

    if (state is VitalsUpdated) {
      if (_step == 0) _temperature = state.temperature;
      if (_step == 1 && _electrodesReady && state.ecg.isNotEmpty) {
        _ecgSamples.addAll(state.ecg);
      }
      if (_step == 2) {
        if (state.heartRate != null) _heartRate = state.heartRate;
        if (state.spo2 != null) _oxygenLevel = state.spo2!.toDouble();
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Daily Vitals Check')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildStepContent(),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_step) {
      case 0:
        return TemperatureStep(temperature: _temperature, onConfirm: _nextStep);
      case 1:
        return EcgStep(
          ecgSamples: _ecgSamples,
          onElectrodesReady: () {
            setState(() {
              _electrodesReady = true;
            });
          },
          onConfirm: _nextStep,
        );

      case 2:
        return FingerSensorStep(
          heartRate: _heartRate,
          oxygenLevel: _oxygenLevel,
          onHeartRateMeasured: (val) => setState(() => _heartRate = val),
          onOxygenLevelMeasured: (val) => setState(() => _oxygenLevel = val),
          onConfirm: _saveVitals,
        );

      default:
        return Center(child: Text('Unknown step'));
    }
  }
}
