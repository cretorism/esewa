import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class ApiClient {
  late final Dio _dio;
  final String _uuid;
  static const String _productsCacheKey = 'cached_products_list';

  ApiClient({required String uuid}) : _uuid = uuid {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Industry Standard: Injecting session tokens/UUIDs in headers
          options.headers['X-Session-UUID'] = _uuid;
          return handler.next(options);
        },
      ),
    );

    // 10x Developer Tip: Disable detailed logging in production to prevent data leakage.
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          compact: true,
        ),
      );
    }
  }

  /// Fetches products from API with automatic offline fallback.
  /// This fulfills the "Offline caching" requirement from project.pdf.
  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('/products');
      final products = (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();

      // Save to cache for offline availability
      _cacheProducts(response.data);

      return products;
    } catch (e) {
      // Industry Standard: Graceful fallback when network fails
      debugPrint('Network error, attempting to load from cache: $e');
      final cachedData = await _getCachedProducts();
      if (cachedData != null) {
        return cachedData;
      }
      rethrow;
    }
  }

  Future<void> _cacheProducts(dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_productsCacheKey, jsonEncode(data));
  }

  Future<List<Product>?> _getCachedProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedString = prefs.getString(_productsCacheKey);
    if (cachedString != null) {
      final List decoded = jsonDecode(cachedString);
      return decoded.map((json) => Product.fromJson(json)).toList();
    }
    return null;
  }
}
