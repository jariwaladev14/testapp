import 'package:dio/dio.dart';
import 'package:testapp/features/home_screen/data/models/product_model.dart';

class ProductDataSource {
  final Dio dio;

  ProductDataSource(this.dio);

  Future<ProductModel> getProduct({
    required String accessToken,
    required String query,
  }) async {
    try {
      final response = await dio.post(
        'https://puja-mobile-app-builder.myshopify.com/api/2025-01/graphql.json',
        data: query,
        options: Options(headers: {
          'X-Shopify-Storefront-Access-Token': accessToken,
          'Content-Type': 'application/graphql',
        }),
      );

      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
