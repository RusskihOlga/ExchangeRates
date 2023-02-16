import 'dart:async';

import 'package:flutter/services.dart';

class BatteryPlugin {
  final MethodChannel _messageChannel = const MethodChannel('ru.exchange_rates.battery');
  final EventChannel _eventChannel = const EventChannel('ru.exchange_rates.battery/listener');

  StreamSubscription? _subscription;

  Future<void> startListener(Function(String? status) callback) async {
    _subscription = _eventChannel.receiveBroadcastStream().listen((event) {
      callback(event);
    });
  }

  Future<void> stopListener() async {
    _subscription?.cancel();
    _subscription = null;
  }

  Future<int> getBatteryValue() async {
    var value = await _messageChannel.invokeMethod('getBatteryValue');
    return value;
  }
}