// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  String get uuid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  ThemeColors get colors => throw _privateConstructorUsedError;
  SpacingConfig get spacing => throw _privateConstructorUsedError;
  TypographyConfig get typography => throw _privateConstructorUsedError;

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call({
    String uuid,
    String username,
    ThemeMode themeMode,
    ThemeColors colors,
    SpacingConfig spacing,
    TypographyConfig typography,
  });

  $ThemeColorsCopyWith<$Res> get colors;
  $SpacingConfigCopyWith<$Res> get spacing;
  $TypographyConfigCopyWith<$Res> get typography;
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? username = null,
    Object? themeMode = null,
    Object? colors = null,
    Object? spacing = null,
    Object? typography = null,
  }) {
    return _then(
      _value.copyWith(
            uuid: null == uuid
                ? _value.uuid
                : uuid // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            themeMode: null == themeMode
                ? _value.themeMode
                : themeMode // ignore: cast_nullable_to_non_nullable
                      as ThemeMode,
            colors: null == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as ThemeColors,
            spacing: null == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as SpacingConfig,
            typography: null == typography
                ? _value.typography
                : typography // ignore: cast_nullable_to_non_nullable
                      as TypographyConfig,
          )
          as $Val,
    );
  }

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThemeColorsCopyWith<$Res> get colors {
    return $ThemeColorsCopyWith<$Res>(_value.colors, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpacingConfigCopyWith<$Res> get spacing {
    return $SpacingConfigCopyWith<$Res>(_value.spacing, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypographyConfigCopyWith<$Res> get typography {
    return $TypographyConfigCopyWith<$Res>(_value.typography, (value) {
      return _then(_value.copyWith(typography: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
    _$AppConfigImpl value,
    $Res Function(_$AppConfigImpl) then,
  ) = __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String uuid,
    String username,
    ThemeMode themeMode,
    ThemeColors colors,
    SpacingConfig spacing,
    TypographyConfig typography,
  });

  @override
  $ThemeColorsCopyWith<$Res> get colors;
  @override
  $SpacingConfigCopyWith<$Res> get spacing;
  @override
  $TypographyConfigCopyWith<$Res> get typography;
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
    _$AppConfigImpl _value,
    $Res Function(_$AppConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? username = null,
    Object? themeMode = null,
    Object? colors = null,
    Object? spacing = null,
    Object? typography = null,
  }) {
    return _then(
      _$AppConfigImpl(
        uuid: null == uuid
            ? _value.uuid
            : uuid // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        themeMode: null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                  as ThemeMode,
        colors: null == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as ThemeColors,
        spacing: null == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as SpacingConfig,
        typography: null == typography
            ? _value.typography
            : typography // ignore: cast_nullable_to_non_nullable
                  as TypographyConfig,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigImpl implements _AppConfig {
  const _$AppConfigImpl({
    required this.uuid,
    required this.username,
    required this.themeMode,
    required this.colors,
    required this.spacing,
    required this.typography,
  });

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

  @override
  final String uuid;
  @override
  final String username;
  @override
  final ThemeMode themeMode;
  @override
  final ThemeColors colors;
  @override
  final SpacingConfig spacing;
  @override
  final TypographyConfig typography;

  @override
  String toString() {
    return 'AppConfig(uuid: $uuid, username: $username, themeMode: $themeMode, colors: $colors, spacing: $spacing, typography: $typography)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.typography, typography) ||
                other.typography == typography));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    uuid,
    username,
    themeMode,
    colors,
    spacing,
    typography,
  );

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(this);
  }
}

abstract class _AppConfig implements AppConfig {
  const factory _AppConfig({
    required final String uuid,
    required final String username,
    required final ThemeMode themeMode,
    required final ThemeColors colors,
    required final SpacingConfig spacing,
    required final TypographyConfig typography,
  }) = _$AppConfigImpl;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

  @override
  String get uuid;
  @override
  String get username;
  @override
  ThemeMode get themeMode;
  @override
  ThemeColors get colors;
  @override
  SpacingConfig get spacing;
  @override
  TypographyConfig get typography;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThemeColors _$ThemeColorsFromJson(Map<String, dynamic> json) {
  return _ThemeColors.fromJson(json);
}

/// @nodoc
mixin _$ThemeColors {
  String get primary => throw _privateConstructorUsedError;
  String get secondary => throw _privateConstructorUsedError;
  String get background => throw _privateConstructorUsedError;
  String get surface => throw _privateConstructorUsedError;
  String get textPrimary => throw _privateConstructorUsedError;
  String get textSecondary => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get success => throw _privateConstructorUsedError;

  /// Serializes this ThemeColors to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThemeColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeColorsCopyWith<ThemeColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeColorsCopyWith<$Res> {
  factory $ThemeColorsCopyWith(
    ThemeColors value,
    $Res Function(ThemeColors) then,
  ) = _$ThemeColorsCopyWithImpl<$Res, ThemeColors>;
  @useResult
  $Res call({
    String primary,
    String secondary,
    String background,
    String surface,
    String textPrimary,
    String textSecondary,
    String error,
    String success,
  });
}

/// @nodoc
class _$ThemeColorsCopyWithImpl<$Res, $Val extends ThemeColors>
    implements $ThemeColorsCopyWith<$Res> {
  _$ThemeColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? secondary = null,
    Object? background = null,
    Object? surface = null,
    Object? textPrimary = null,
    Object? textSecondary = null,
    Object? error = null,
    Object? success = null,
  }) {
    return _then(
      _value.copyWith(
            primary: null == primary
                ? _value.primary
                : primary // ignore: cast_nullable_to_non_nullable
                      as String,
            secondary: null == secondary
                ? _value.secondary
                : secondary // ignore: cast_nullable_to_non_nullable
                      as String,
            background: null == background
                ? _value.background
                : background // ignore: cast_nullable_to_non_nullable
                      as String,
            surface: null == surface
                ? _value.surface
                : surface // ignore: cast_nullable_to_non_nullable
                      as String,
            textPrimary: null == textPrimary
                ? _value.textPrimary
                : textPrimary // ignore: cast_nullable_to_non_nullable
                      as String,
            textSecondary: null == textSecondary
                ? _value.textSecondary
                : textSecondary // ignore: cast_nullable_to_non_nullable
                      as String,
            error: null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String,
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThemeColorsImplCopyWith<$Res>
    implements $ThemeColorsCopyWith<$Res> {
  factory _$$ThemeColorsImplCopyWith(
    _$ThemeColorsImpl value,
    $Res Function(_$ThemeColorsImpl) then,
  ) = __$$ThemeColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String primary,
    String secondary,
    String background,
    String surface,
    String textPrimary,
    String textSecondary,
    String error,
    String success,
  });
}

/// @nodoc
class __$$ThemeColorsImplCopyWithImpl<$Res>
    extends _$ThemeColorsCopyWithImpl<$Res, _$ThemeColorsImpl>
    implements _$$ThemeColorsImplCopyWith<$Res> {
  __$$ThemeColorsImplCopyWithImpl(
    _$ThemeColorsImpl _value,
    $Res Function(_$ThemeColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? secondary = null,
    Object? background = null,
    Object? surface = null,
    Object? textPrimary = null,
    Object? textSecondary = null,
    Object? error = null,
    Object? success = null,
  }) {
    return _then(
      _$ThemeColorsImpl(
        primary: null == primary
            ? _value.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as String,
        secondary: null == secondary
            ? _value.secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as String,
        background: null == background
            ? _value.background
            : background // ignore: cast_nullable_to_non_nullable
                  as String,
        surface: null == surface
            ? _value.surface
            : surface // ignore: cast_nullable_to_non_nullable
                  as String,
        textPrimary: null == textPrimary
            ? _value.textPrimary
            : textPrimary // ignore: cast_nullable_to_non_nullable
                  as String,
        textSecondary: null == textSecondary
            ? _value.textSecondary
            : textSecondary // ignore: cast_nullable_to_non_nullable
                  as String,
        error: null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeColorsImpl implements _ThemeColors {
  const _$ThemeColorsImpl({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.error,
    required this.success,
  });

  factory _$ThemeColorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeColorsImplFromJson(json);

  @override
  final String primary;
  @override
  final String secondary;
  @override
  final String background;
  @override
  final String surface;
  @override
  final String textPrimary;
  @override
  final String textSecondary;
  @override
  final String error;
  @override
  final String success;

  @override
  String toString() {
    return 'ThemeColors(primary: $primary, secondary: $secondary, background: $background, surface: $surface, textPrimary: $textPrimary, textSecondary: $textSecondary, error: $error, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeColorsImpl &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.surface, surface) || other.surface == surface) &&
            (identical(other.textPrimary, textPrimary) ||
                other.textPrimary == textPrimary) &&
            (identical(other.textSecondary, textSecondary) ||
                other.textSecondary == textSecondary) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary,
    secondary,
    background,
    surface,
    textPrimary,
    textSecondary,
    error,
    success,
  );

  /// Create a copy of ThemeColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeColorsImplCopyWith<_$ThemeColorsImpl> get copyWith =>
      __$$ThemeColorsImplCopyWithImpl<_$ThemeColorsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeColorsImplToJson(this);
  }
}

abstract class _ThemeColors implements ThemeColors {
  const factory _ThemeColors({
    required final String primary,
    required final String secondary,
    required final String background,
    required final String surface,
    required final String textPrimary,
    required final String textSecondary,
    required final String error,
    required final String success,
  }) = _$ThemeColorsImpl;

  factory _ThemeColors.fromJson(Map<String, dynamic> json) =
      _$ThemeColorsImpl.fromJson;

  @override
  String get primary;
  @override
  String get secondary;
  @override
  String get background;
  @override
  String get surface;
  @override
  String get textPrimary;
  @override
  String get textSecondary;
  @override
  String get error;
  @override
  String get success;

  /// Create a copy of ThemeColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeColorsImplCopyWith<_$ThemeColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpacingConfig _$SpacingConfigFromJson(Map<String, dynamic> json) {
  return _SpacingConfig.fromJson(json);
}

/// @nodoc
mixin _$SpacingConfig {
  double get small => throw _privateConstructorUsedError;
  double get medium => throw _privateConstructorUsedError;
  double get large => throw _privateConstructorUsedError;

  /// Serializes this SpacingConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpacingConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpacingConfigCopyWith<SpacingConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpacingConfigCopyWith<$Res> {
  factory $SpacingConfigCopyWith(
    SpacingConfig value,
    $Res Function(SpacingConfig) then,
  ) = _$SpacingConfigCopyWithImpl<$Res, SpacingConfig>;
  @useResult
  $Res call({double small, double medium, double large});
}

/// @nodoc
class _$SpacingConfigCopyWithImpl<$Res, $Val extends SpacingConfig>
    implements $SpacingConfigCopyWith<$Res> {
  _$SpacingConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpacingConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? small = null,
    Object? medium = null,
    Object? large = null,
  }) {
    return _then(
      _value.copyWith(
            small: null == small
                ? _value.small
                : small // ignore: cast_nullable_to_non_nullable
                      as double,
            medium: null == medium
                ? _value.medium
                : medium // ignore: cast_nullable_to_non_nullable
                      as double,
            large: null == large
                ? _value.large
                : large // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpacingConfigImplCopyWith<$Res>
    implements $SpacingConfigCopyWith<$Res> {
  factory _$$SpacingConfigImplCopyWith(
    _$SpacingConfigImpl value,
    $Res Function(_$SpacingConfigImpl) then,
  ) = __$$SpacingConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double small, double medium, double large});
}

/// @nodoc
class __$$SpacingConfigImplCopyWithImpl<$Res>
    extends _$SpacingConfigCopyWithImpl<$Res, _$SpacingConfigImpl>
    implements _$$SpacingConfigImplCopyWith<$Res> {
  __$$SpacingConfigImplCopyWithImpl(
    _$SpacingConfigImpl _value,
    $Res Function(_$SpacingConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpacingConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? small = null,
    Object? medium = null,
    Object? large = null,
  }) {
    return _then(
      _$SpacingConfigImpl(
        small: null == small
            ? _value.small
            : small // ignore: cast_nullable_to_non_nullable
                  as double,
        medium: null == medium
            ? _value.medium
            : medium // ignore: cast_nullable_to_non_nullable
                  as double,
        large: null == large
            ? _value.large
            : large // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpacingConfigImpl implements _SpacingConfig {
  const _$SpacingConfigImpl({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory _$SpacingConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpacingConfigImplFromJson(json);

  @override
  final double small;
  @override
  final double medium;
  @override
  final double large;

  @override
  String toString() {
    return 'SpacingConfig(small: $small, medium: $medium, large: $large)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpacingConfigImpl &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.large, large) || other.large == large));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, small, medium, large);

  /// Create a copy of SpacingConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpacingConfigImplCopyWith<_$SpacingConfigImpl> get copyWith =>
      __$$SpacingConfigImplCopyWithImpl<_$SpacingConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpacingConfigImplToJson(this);
  }
}

abstract class _SpacingConfig implements SpacingConfig {
  const factory _SpacingConfig({
    required final double small,
    required final double medium,
    required final double large,
  }) = _$SpacingConfigImpl;

  factory _SpacingConfig.fromJson(Map<String, dynamic> json) =
      _$SpacingConfigImpl.fromJson;

  @override
  double get small;
  @override
  double get medium;
  @override
  double get large;

  /// Create a copy of SpacingConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpacingConfigImplCopyWith<_$SpacingConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypographyConfig _$TypographyConfigFromJson(Map<String, dynamic> json) {
  return _TypographyConfig.fromJson(json);
}

/// @nodoc
mixin _$TypographyConfig {
  double get bodySize => throw _privateConstructorUsedError;
  double get titleSize => throw _privateConstructorUsedError;
  String get fontFamily => throw _privateConstructorUsedError;

  /// Serializes this TypographyConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypographyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypographyConfigCopyWith<TypographyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypographyConfigCopyWith<$Res> {
  factory $TypographyConfigCopyWith(
    TypographyConfig value,
    $Res Function(TypographyConfig) then,
  ) = _$TypographyConfigCopyWithImpl<$Res, TypographyConfig>;
  @useResult
  $Res call({double bodySize, double titleSize, String fontFamily});
}

/// @nodoc
class _$TypographyConfigCopyWithImpl<$Res, $Val extends TypographyConfig>
    implements $TypographyConfigCopyWith<$Res> {
  _$TypographyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypographyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodySize = null,
    Object? titleSize = null,
    Object? fontFamily = null,
  }) {
    return _then(
      _value.copyWith(
            bodySize: null == bodySize
                ? _value.bodySize
                : bodySize // ignore: cast_nullable_to_non_nullable
                      as double,
            titleSize: null == titleSize
                ? _value.titleSize
                : titleSize // ignore: cast_nullable_to_non_nullable
                      as double,
            fontFamily: null == fontFamily
                ? _value.fontFamily
                : fontFamily // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TypographyConfigImplCopyWith<$Res>
    implements $TypographyConfigCopyWith<$Res> {
  factory _$$TypographyConfigImplCopyWith(
    _$TypographyConfigImpl value,
    $Res Function(_$TypographyConfigImpl) then,
  ) = __$$TypographyConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double bodySize, double titleSize, String fontFamily});
}

/// @nodoc
class __$$TypographyConfigImplCopyWithImpl<$Res>
    extends _$TypographyConfigCopyWithImpl<$Res, _$TypographyConfigImpl>
    implements _$$TypographyConfigImplCopyWith<$Res> {
  __$$TypographyConfigImplCopyWithImpl(
    _$TypographyConfigImpl _value,
    $Res Function(_$TypographyConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypographyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodySize = null,
    Object? titleSize = null,
    Object? fontFamily = null,
  }) {
    return _then(
      _$TypographyConfigImpl(
        bodySize: null == bodySize
            ? _value.bodySize
            : bodySize // ignore: cast_nullable_to_non_nullable
                  as double,
        titleSize: null == titleSize
            ? _value.titleSize
            : titleSize // ignore: cast_nullable_to_non_nullable
                  as double,
        fontFamily: null == fontFamily
            ? _value.fontFamily
            : fontFamily // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TypographyConfigImpl implements _TypographyConfig {
  const _$TypographyConfigImpl({
    required this.bodySize,
    required this.titleSize,
    required this.fontFamily,
  });

  factory _$TypographyConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypographyConfigImplFromJson(json);

  @override
  final double bodySize;
  @override
  final double titleSize;
  @override
  final String fontFamily;

  @override
  String toString() {
    return 'TypographyConfig(bodySize: $bodySize, titleSize: $titleSize, fontFamily: $fontFamily)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypographyConfigImpl &&
            (identical(other.bodySize, bodySize) ||
                other.bodySize == bodySize) &&
            (identical(other.titleSize, titleSize) ||
                other.titleSize == titleSize) &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bodySize, titleSize, fontFamily);

  /// Create a copy of TypographyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypographyConfigImplCopyWith<_$TypographyConfigImpl> get copyWith =>
      __$$TypographyConfigImplCopyWithImpl<_$TypographyConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TypographyConfigImplToJson(this);
  }
}

abstract class _TypographyConfig implements TypographyConfig {
  const factory _TypographyConfig({
    required final double bodySize,
    required final double titleSize,
    required final String fontFamily,
  }) = _$TypographyConfigImpl;

  factory _TypographyConfig.fromJson(Map<String, dynamic> json) =
      _$TypographyConfigImpl.fromJson;

  @override
  double get bodySize;
  @override
  double get titleSize;
  @override
  String get fontFamily;

  /// Create a copy of TypographyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypographyConfigImplCopyWith<_$TypographyConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
