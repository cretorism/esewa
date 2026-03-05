// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      uuid: json['uuid'] as String,
      username: json['username'] as String,
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
      colors: ThemeColors.fromJson(json['colors'] as Map<String, dynamic>),
      spacing: SpacingConfig.fromJson(json['spacing'] as Map<String, dynamic>),
      typography: TypographyConfig.fromJson(
        json['typography'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'username': instance.username,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'colors': instance.colors,
      'spacing': instance.spacing,
      'typography': instance.typography,
    };

const _$ThemeModeEnumMap = {ThemeMode.light: 'light', ThemeMode.dark: 'dark'};

_$ThemeColorsImpl _$$ThemeColorsImplFromJson(Map<String, dynamic> json) =>
    _$ThemeColorsImpl(
      primary: json['primary'] as String,
      secondary: json['secondary'] as String,
      background: json['background'] as String,
      surface: json['surface'] as String,
      textPrimary: json['textPrimary'] as String,
      textSecondary: json['textSecondary'] as String,
      error: json['error'] as String,
      success: json['success'] as String,
    );

Map<String, dynamic> _$$ThemeColorsImplToJson(_$ThemeColorsImpl instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'background': instance.background,
      'surface': instance.surface,
      'textPrimary': instance.textPrimary,
      'textSecondary': instance.textSecondary,
      'error': instance.error,
      'success': instance.success,
    };

_$SpacingConfigImpl _$$SpacingConfigImplFromJson(Map<String, dynamic> json) =>
    _$SpacingConfigImpl(
      small: (json['small'] as num).toDouble(),
      medium: (json['medium'] as num).toDouble(),
      large: (json['large'] as num).toDouble(),
    );

Map<String, dynamic> _$$SpacingConfigImplToJson(_$SpacingConfigImpl instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

_$TypographyConfigImpl _$$TypographyConfigImplFromJson(
  Map<String, dynamic> json,
) => _$TypographyConfigImpl(
  bodySize: (json['bodySize'] as num).toDouble(),
  titleSize: (json['titleSize'] as num).toDouble(),
  fontFamily: json['fontFamily'] as String,
);

Map<String, dynamic> _$$TypographyConfigImplToJson(
  _$TypographyConfigImpl instance,
) => <String, dynamic>{
  'bodySize': instance.bodySize,
  'titleSize': instance.titleSize,
  'fontFamily': instance.fontFamily,
};
