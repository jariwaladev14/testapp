import 'package:testapp/features/home_screen/data/datasource/product_data_source.dart';
import 'package:testapp/features/home_screen/domain/entities/product.dart';
import 'package:testapp/features/home_screen/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Product> getProduct({
    required String accessToken,
    required String query,
  }) async {
    final productModel = await remoteDataSource.getProduct(
      accessToken: accessToken,
      query: query,
    );
    return productModel
        .toEntity(); // Convert ProductModel to Product entity here
  }
}
