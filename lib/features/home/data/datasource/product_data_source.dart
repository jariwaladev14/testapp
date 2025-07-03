import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:testapp/core/base_api.dart';
import 'package:testapp/features/home/data/models/product_model.dart';

class ProductDataSource {
  Api api = Api();
  Future<ProductModel> getProduct({
    required String accessToken,
    required String query,
  }) async {
    try {
      api.sendRequest.options.headers = {
        'X-Shopify-Storefront-Access-Token': accessToken,
        'Content-Type': 'application/graphql',
      };
      Response response = await api.sendRequest.post(
        '/2025-01/graphql.json',
        data: query,
      );
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        log("Error Status Code:${response.statusCode}");
        return ProductModel(
          id: '',
          title: '',
          description: '',
          productType: '',
          vendor: '',
          handle: '',
          // options: [],
          // tags: [],
          // images: [],
          // variants: [],
          totalInventory: 0,
        );
      }
    } catch (e) {
      log("Error:$e");
      log("came here");
      return ProductModel(
        id: '',
        title: '',
        description: '',
        productType: '',
        vendor: '',
        handle: '',
        // options: [],
        // tags: [],
        // images: [],
        // variants: [],
        totalInventory: 0,
      );
    }
  }
}
