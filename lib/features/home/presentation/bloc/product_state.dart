import 'package:testapp/features/home/domain/entities/product.dart';

class ProductState {
  final Product? product;
  final bool isLoading;
  final String? error;

  ProductState({this.product, this.isLoading = false, this.error});
  
  factory ProductState.initial() =>
      ProductState(product: null, isLoading: true, error: null);

  factory ProductState.loading() =>
      ProductState(product: null, isLoading: true, error: null);

  factory ProductState.success({required Product product}) =>
      ProductState(product: product, isLoading: false, error: null);

  factory ProductState.failure({required String error}) =>
      ProductState(product: null, isLoading: false, error: error);
}
