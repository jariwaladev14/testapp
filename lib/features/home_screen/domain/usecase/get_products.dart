import 'package:testapp/features/home_screen/domain/entities/product.dart';
import 'package:testapp/features/home_screen/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Product> call({required String accessToken, required String query}) {
    return repository.getProduct(accessToken: accessToken, query: query);
  }
}
