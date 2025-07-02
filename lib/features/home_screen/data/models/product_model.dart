import 'package:testapp/features/home_screen/domain/entities/product.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final String productType;
  final String handle;
  final String descriptionHtml;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.productType,
    required this.handle,
    required this.descriptionHtml,
  });

  // Factory constructor to create ProductModel from GraphQL JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final node = json['data']?['node'];

    if (node == null) {
      throw Exception('Missing product node in response');
    }

    return ProductModel(
      id: node['id'] ?? '',
      title: node['title'] ?? '',
      description: node['description'] ?? '',
      productType: node['productType'] ?? '',
      handle: node['handle'] ?? '',
      descriptionHtml: node['descriptionHtml'],
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      productType: productType,
      handle: handle,
      descriptionHtml: descriptionHtml,
    );
  }
}
