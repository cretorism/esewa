import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/app_config.dart';

part 'native_channel_service.g.dart';

@riverpod
NativeChannelService nativeChannelService(Ref ref) {
  final service = NativeChannelService();
  ref.onDispose(service.dispose);
  return service;
}

class NativeChannelService {
  static const MethodChannel _channel = MethodChannel('com.app.native/flutter');

  final _configUpdatesController = StreamController<AppConfig?>.broadcast();
  Stream<AppConfig?> get configUpdates => _configUpdatesController.stream;

  NativeChannelService() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'refreshConfig') {
        if (call.arguments is Map) {
          final config = AppConfig.fromJson(
            _deepCastMap(call.arguments as Map<dynamic, dynamic>),
          );
          _configUpdatesController.add(config);
        } else {
          _configUpdatesController.add(null);
        }
      }
    });
  }

  void dispose() {
    _configUpdatesController.close();
  }

  Future<AppConfig> getAppConfig() async {
    try {
      final Map<dynamic, dynamic>? config = await _channel.invokeMethod(
        'getAppConfig',
      );
      if (config == null) throw Exception('App config is null');
      return AppConfig.fromJson(_deepCastMap(config));
    } on PlatformException catch (e) {
      throw Exception('Failed to get app config: ${e.message}');
    }
  }

  /// Recursively casts a `Map<Object?, Object?>` (from platform channels)
  /// to `Map<String, dynamic>`, including all nested maps.
  Map<String, dynamic> _deepCastMap(Map<dynamic, dynamic> map) {
    return map.map((key, value) {
      if (value is Map) {
        return MapEntry(key.toString(), _deepCastMap(value));
      } else if (value is List) {
        return MapEntry(key.toString(), _deepCastList(value));
      }
      return MapEntry(key.toString(), value);
    });
  }

  List<dynamic> _deepCastList(List<dynamic> list) {
    return list.map((item) {
      if (item is Map) {
        return _deepCastMap(item);
      } else if (item is List) {
        return _deepCastList(item);
      }
      return item;
    }).toList();
  }

  Future<void> initiatePayment(Map<String, dynamic> payload) async {
    try {
      await _channel.invokeMethod('initiatePayment', payload);
    } on PlatformException catch (e) {
      throw Exception('Failed to initiate payment: ${e.message}');
    }
  }

  Future<void> logout() async {
    try {
      await _channel.invokeMethod('logout');
    } on PlatformException catch (e) {
      throw Exception('Failed to logout: ${e.message}');
    }
  }
}
