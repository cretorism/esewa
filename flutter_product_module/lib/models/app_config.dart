import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

enum ThemeMode { light, dark }

@freezed
class AppConfig with _$AppConfig {
  const factory AppConfig({
    required String uuid,
    required String username,
    required ThemeMode themeMode,
    required ThemeColors colors,
    required SpacingConfig spacing,
    required TypographyConfig typography,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}

@freezed
class ThemeColors with _$ThemeColors {
  const factory ThemeColors({
    required String primary,
    required String secondary,
    required String background,
    required String surface,
    required String textPrimary,
    required String textSecondary,
    required String error,
    required String success,
  }) = _ThemeColors;

  factory ThemeColors.fromJson(Map<String, dynamic> json) =>
      _$ThemeColorsFromJson(json);
}

@freezed
class SpacingConfig with _$SpacingConfig {
  const factory SpacingConfig({
    required double small,
    required double medium,
    required double large,
  }) = _SpacingConfig;

  factory SpacingConfig.fromJson(Map<String, dynamic> json) =>
      _$SpacingConfigFromJson(json);
}

@freezed
class TypographyConfig with _$TypographyConfig {
  const factory TypographyConfig({
    required double bodySize,
    required double titleSize,
    required String fontFamily,
  }) = _TypographyConfig;

  factory TypographyConfig.fromJson(Map<String, dynamic> json) =>
      _$TypographyConfigFromJson(json);
}
