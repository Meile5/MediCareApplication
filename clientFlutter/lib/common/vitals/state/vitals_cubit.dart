import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/event_models/events.dart';
import 'package:medicare/common/utility/websocket_service.dart';

part 'vitals_state.dart';

class VitalsCubit extends Cubit<VitalsState> {
  final WebSocketService webSocketService;
  StreamSubscription? _subscription;
  bool _isSubscribed = false;

  VitalsCubit({required this.webSocketService}) : super(VitalsInitial());

  void subscribeToVitals(String deviceId) {
    if (_isSubscribed) return;

    _isSubscribed = true;

    webSocketService.send(SubscribeToVitals(deviceId: deviceId).toJson());

    _subscription = webSocketService.stream.listen(
      (rawEvent) {
        print('Received raw event: $rawEvent');
        try {
          final message = BaseEventMapper.fromJson(rawEvent);
          if (message is DeviceVitals) {
            emit(
              VitalsUpdated(temperature: message.temperature, ecg: message.ecg),
            );
          }
        } catch (e) {
          emit(VitalsError(message: 'Failed to process vitals data: $e'));
        }
      },
      onError: (error) {
        emit(VitalsError(message: 'WebSocket error: $error'));
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
    _isSubscribed = false; // Reset the subscription status when cubit is closed
    return super.close();
  }
}
