import 'package:testapp/models/product_model.dart';

class ProductState {
  final Product? product;
  final bool isLoading;
  final String? error;

  ProductState({this.product, this.isLoading = false, this.error});

  factory ProductState.initial() =>
      ProductState(product: null, isLoading: true);

  factory ProductState.loading() => ProductState(isLoading: true);

  factory ProductState.success({Product? product}) =>
      ProductState(product: product);

  factory ProductState.failure({String? error}) => ProductState(error: error);
}
