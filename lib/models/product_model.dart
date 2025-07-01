class Product {
  final String id;
  final String title;
  final String description;
  final String handle;
  final String descriptionHtml;
  final String productType;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.handle,
    required this.descriptionHtml,
    required this.productType,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final node = json['data']['node'];
    return Product(
      id: node['id'] ?? "",
      title: node['title'] ?? "",
      description: node['description'] ?? "",
      handle: node['handle'] ?? "",
      descriptionHtml: node['descriptionHtml'] ?? "",
      productType: node['productType'] ?? "",
    );
  }
}
