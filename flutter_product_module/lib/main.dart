import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/config_provider.dart';
import 'services/native_channel_service.dart';
import 'screens/product_list_screen.dart';
import 'models/app_config.dart' as cfg;

void main() {
  runApp(const ProviderScope(child: FlutterModuleApp()));
}

@pragma('vm:entry-point')
void mainWithConfig(Map<String, dynamic> initialConfig) {
  runApp(
    ProviderScope(
      overrides: [initialConfigProvider.overrideWithValue(initialConfig)],
      child: FlutterModuleApp(initialConfig: initialConfig),
    ),
  );
}

class FlutterModuleApp extends ConsumerWidget {
  final Map<String, dynamic>? initialConfig;
  const FlutterModuleApp({super.key, this.initialConfig});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configAsync = ref.watch(appConfigNotifierProvider);

    return configAsync.when(
      data: (config) {
        final lightTheme = _buildThemeData(config, isDark: false);
        final darkTheme = _buildThemeData(config, isDark: true);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Product Module',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: config.themeMode == cfg.ThemeMode.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const ProductListScreen(),
        );
      },
      loading: () => _buildLoadingScreen(),
      error: (err, _) => MaterialApp(
        home: Scaffold(body: Center(child: Text('Config Error: $err'))),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    // Attempt to guess the theme from current brightness to avoid flicker
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }

  ThemeData _buildThemeData(cfg.AppConfig config, {required bool isDark}) {
    final primaryColor = _parseColor(config.colors.primary);
    final backgroundColor = _parseColor(config.colors.background);
    final textPrimary = _parseColor(config.colors.textPrimary);

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? Colors.black : primaryColor,
        foregroundColor: isDark ? Colors.white : Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: primaryColor,
            brightness: isDark ? Brightness.dark : Brightness.light,
          ).copyWith(
            primary: primaryColor,
            surface: _parseColor(config.colors.surface),
            onSurface: textPrimary,
            background: backgroundColor,
            onBackground: textPrimary,
          ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: config.typography.bodySize,
          color: textPrimary,
          fontFamily: config.typography.fontFamily,
        ),
        titleLarge: TextStyle(
          fontSize: config.typography.titleSize,
          fontWeight: FontWeight.bold,
          color: textPrimary,
          fontFamily: config.typography.fontFamily,
        ),
      ),
    );
  }

  Color _parseColor(String hex) {
    try {
      final buffer = StringBuffer();
      if (hex.length == 7) buffer.write('ff');
      buffer.write(hex.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Colors.blue;
    }
  }
}
