import 'package:testapp/models/product_model.dart';

class ProductState {
  final Product? product;

  ProductState({this.product});

  factory ProductState.initial() => ProductState(product: null);

  ProductState copyWith({Product? product}) {
    return ProductState(product: product ?? this.product);
  }
}
