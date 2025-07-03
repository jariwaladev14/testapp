abstract class ProductEvent {}

class GetProductData extends ProductEvent {
  GetProductData({required this.accessToken});

  final String accessToken;
}
