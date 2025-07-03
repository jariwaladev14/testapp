import 'package:testapp/features/home/domain/entities/product.dart';
import 'package:testapp/features/home/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Product> call({required String accessToken, required String query}) {
    return repository.getProducts(accessToken: accessToken, query: query);
  }
}
