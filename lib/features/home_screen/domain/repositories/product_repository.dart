import 'package:testapp/features/home_screen/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Product> getProduct({
    required String accessToken,
    required String query,
  });
}
