import 'package:testapp/features/home/data/datasource/product_data_source.dart';
import 'package:testapp/features/home/domain/entities/product.dart';
import 'package:testapp/features/home/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Product> getProducts({
    required String accessToken,
    required String query,
  }) async {
    final productModel = await remoteDataSource.getProduct(
      accessToken: accessToken,
      query: query,
    );
    return productModel.toEntity();
  }
}
