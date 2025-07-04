import 'package:get_it/get_it.dart';
import 'package:testapp/features/home/data/datasource/product_data_source.dart';
import 'package:testapp/features/home/data/repositories/product_repository_impl.dart';
import 'package:testapp/features/home/domain/usecase/get_products.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ProductDataSource>(() => ProductDataSource());
  getIt.registerLazySingleton<ProductRepositoryImpl>(
    () => ProductRepositoryImpl(getIt<ProductDataSource>()),
  );
  getIt.registerLazySingleton<GetProducts>(
    () => GetProducts(getIt<ProductRepositoryImpl>()),
  );
}
