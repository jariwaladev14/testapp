import 'package:testapp/features/home/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Product> getProducts({
    required String accessToken,
    required String query,
  });
}
