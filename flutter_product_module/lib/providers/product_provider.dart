import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';
import '../services/api_client.dart';
import 'config_provider.dart';

part 'product_provider.g.dart';

@riverpod
Future<List<Product>> productList(Ref ref) async {
  final config = await ref.watch(appConfigNotifierProvider.future);
  final apiClient = ApiClient(uuid: config.uuid);
  return await apiClient.getProducts();
}
