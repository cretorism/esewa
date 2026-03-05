// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initialConfigHash() => r'5b9483a5af0d7970a6353c15bc1ca15a82c330de';

/// See also [initialConfig].
@ProviderFor(initialConfig)
final initialConfigProvider = AutoDisposeProvider<Object?>.internal(
  initialConfig,
  name: r'initialConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$initialConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InitialConfigRef = AutoDisposeProviderRef<Object?>;
String _$hasBeenRefreshedHash() => r'1cc8f866042b944c325bd049aa77691945a14f59';

/// See also [HasBeenRefreshed].
@ProviderFor(HasBeenRefreshed)
final hasBeenRefreshedProvider =
    AutoDisposeNotifierProvider<HasBeenRefreshed, bool>.internal(
      HasBeenRefreshed.new,
      name: r'hasBeenRefreshedProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$hasBeenRefreshedHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$HasBeenRefreshed = AutoDisposeNotifier<bool>;
String _$appConfigNotifierHash() => r'174848c6c9d732dc2c46f0bf068ce59761cb1e8a';

/// See also [AppConfigNotifier].
@ProviderFor(AppConfigNotifier)
final appConfigNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AppConfigNotifier, cfg.AppConfig>.internal(
      AppConfigNotifier.new,
      name: r'appConfigNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appConfigNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppConfigNotifier = AutoDisposeAsyncNotifier<cfg.AppConfig>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
