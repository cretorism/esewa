import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_config.dart' as cfg;
import '../services/native_channel_service.dart';

part 'config_provider.g.dart';

@riverpod
Object? initialConfig(Ref ref) {
  return null; // Will be overridden in main.dart
}

@riverpod
class HasBeenRefreshed extends _$HasBeenRefreshed {
  @override
  bool build() => false;

  void markRefreshed() => state = true;
}

@riverpod
class AppConfigNotifier extends _$AppConfigNotifier {
  @override
  Future<cfg.AppConfig> build() async {
    final initial = ref.watch(initialConfigProvider);
    final hasBeenRefreshed = ref.watch(hasBeenRefreshedProvider);
    final nativeService = ref.watch(nativeChannelServiceProvider);

    // Subscribe to real-time updates from native
    final subscription = nativeService.configUpdates.listen((newConfig) {
      refresh(newConfig);
    });
    ref.onDispose(subscription.cancel);

    // 1. Try initial config from native (if provided and not refreshed yet)
    if (!hasBeenRefreshed && initial is Map<String, dynamic>) {
      final config = cfg.AppConfig.fromJson(initial);
      _cacheConfig(config);
      return config;
    }

    // 2. Try local cache
    final prefs = await SharedPreferences.getInstance();
    final cachedRecord = prefs.getString('app_config_cache');
    if (!hasBeenRefreshed && cachedRecord != null) {
      try {
        return cfg.AppConfig.fromJson(jsonDecode(cachedRecord));
      } catch (e) {
        // Fallback to native if cache is corrupt
      }
    }

    // 3. Fetch from native
    final config = await nativeService.getAppConfig();
    _cacheConfig(config);
    return config;
  }

  Future<void> _cacheConfig(cfg.AppConfig config) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_config_cache', jsonEncode(config.toJson()));
  }

  void refresh([cfg.AppConfig? newConfig]) async {
    state = const AsyncValue.loading();
    ref.read(hasBeenRefreshedProvider.notifier).markRefreshed();

    if (newConfig != null) {
      await _cacheConfig(newConfig);
      state = AsyncValue.data(newConfig);
      return;
    }

    // Explicitly fetch and cache before invalidating so the UI can transition smoothly
    final nativeService = ref.read(nativeChannelServiceProvider);
    try {
      final config = await nativeService.getAppConfig();
      await _cacheConfig(config);
      state = AsyncValue.data(config);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
