import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/auth/auth_prefs.dart';
import 'package:medicare/common/event_models/events.dart';
import 'package:medicare/common/utility/websocket_service.dart';
import 'package:medicare/errorHandling/application_messages.dart';

import '../../../patient/vitals/utils/vitals_data_source.dart';

part 'vitals_state.dart';

class VitalsCubit extends Cubit<VitalsState> {
  final WebSocketService webSocketService;
  final VitalsDataSource dataSource;
  StreamSubscription? _subscription;
  bool _isSubscribed = false;

  VitalsCubit({required this.webSocketService, required this.dataSource})
    : super(VitalsInitial());

  void subscribeToVitals(String deviceId) {
    if (_isSubscribed) return;

    _isSubscribed = true;

    webSocketService.send(
      SubscribeToVitals(deviceId: deviceId, token: AuthPrefs.jwt).toJson(),
    );

    _subscription = webSocketService.stream.listen(
      (rawEvent) {
        print('Received raw event: $rawEvent');
        try {
          final message = BaseEventMapper.fromJson(rawEvent);
          if (message is DeviceVitals) {
            emit(
              VitalsUpdated(
                temperature: message.temperature,
                ecg: message.ecg,
                heartRate: message.heartRate,
                spo2: message.spo2,
              ),
            );
          }
        } catch (e) {
          emit(VitalsError(message: ApplicationMessages.generalError.message));
        }
      },
      onError: (error) {
        emit(VitalsError(message: ApplicationMessages.serverError.message));
      },
    );
  }

  void unsubscribeFromVitals(String deviceId) {
    if (!_isSubscribed) return;

    webSocketService.send(UnsubscribeFromVitals(deviceId: deviceId).toJson());

    _subscription?.cancel();
    _subscription = null;
    _isSubscribed = false;
    print('Unsubscribed from vitals for device: $deviceId');
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _isSubscribed = false;
    return super.close();
  }

  Future<String> pairDevice(String pairingCode) async {
    try {
      return await dataSource.pairDevice(pairingCode);
    } catch (e) {
      emit(VitalsError(message: "Failed to pair device."));
      rethrow;
    }
  }
}
