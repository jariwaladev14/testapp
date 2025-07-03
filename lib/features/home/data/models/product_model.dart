import 'package:testapp/features/home/domain/entities/product.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final String productType;
  final String vendor;
  final String handle;
  // final List<Options> options;
  // final List<String> tags;
  // final List<String> images;
  // final List<Variants> variants;
  final int totalInventory;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.productType,
    required this.vendor,
    required this.handle,
    // required this.options,
    // required this.tags,
    // required this.images,
    // required this.variants,
    required this.totalInventory,
  });

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
      vendor: node['vendor'] ?? '',
      handle: node['handle'] ?? '',
      // options: (node['options'] as List<dynamic>? ?? [])
      //     .map((v) => Options.fromJson(v))
      //     .toList(),
      // tags: List<String>.from(node['tags'] ?? []),
      // images: List<String>.from(node['images'] ?? []),
      // variants: (node['variants'] as List<dynamic>? ?? [])
      //     .map((v) => Variants.fromJson(v))
      //     .toList(),
      totalInventory: node['totalInventory'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'productType': productType,
      'vendor': vendor,
      'handle': handle,
      // 'options': options.map((v) => v.toJson()).toList(),
      // 'tags': tags,
      // 'images': images,
      // 'variants': variants.map((v) => v.toJson()).toList(),
      'totalInventory': totalInventory,
    };
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      productType: productType,
      handle: handle,
    );
  }
}

class Options {
  final String name;
  final List<String> values;

  Options({required this.name, required this.values});

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      name: json['name'] ?? '',
      values: List<String>.from(json['values'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'values': values};
  }
}

class Variants {
  final String id;
  final String title;
  final String price;
  final String? compareAtPrice;
  final bool availableForSale;
  final String? image;
  final int quantityAvailable;

  Variants({
    required this.id,
    required this.title,
    required this.price,
    this.compareAtPrice,
    required this.availableForSale,
    this.image,
    required this.quantityAvailable,
  });

  factory Variants.fromJson(Map<String, dynamic> json) {
    return Variants(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      price: json['price'] ?? '',
      compareAtPrice: json['compareAtPrice'],
      availableForSale: json['availableForSale'] ?? false,
      image: json['image'],
      quantityAvailable: json['quantityAvailable'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'compareAtPrice': compareAtPrice,
      'availableForSale': availableForSale,
      'image': image,
      'quantityAvailable': quantityAvailable,
    };
  }
}

/*

class ProductModel {
  String? id;
  String? title;
  String? description;
  String? productType;
  String? vendor;
  String? handle;
  List<Options>? options;
  List<String>? tags;
  List<String>? images;
  List<Variants>? variants;
  int? totalInventory;

  ProductModel(
      {this.id,
      this.title,
      this.description,
      this.productType,
      this.vendor,
      this.handle,
      this.options,
      this.tags,
      this.images,
      this.variants,
      this.totalInventory});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    productType = json['productType'];
    vendor = json['vendor'];
    handle = json['handle'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
    images = json['images'].cast<String>();
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    totalInventory = json['totalInventory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['productType'] = this.productType;
    data['vendor'] = this.vendor;
    data['handle'] = this.handle;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['tags'] = this.tags;
    data['images'] = this.images;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['totalInventory'] = this.totalInventory;
    return data;
  }
}

class Options {
  String? name;
  List<String>? values;

  Options({this.name, this.values});

  Options.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    values = json['values'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['values'] = this.values;
    return data;
  }
}

class Variants {
  String? id;
  String? title;
  String? price;
  String? compareAtPrice;
  bool? availableForSale;
  String? image;
  int? quantityAvailable;

  Variants(
      {this.id,
      this.title,
      this.price,
      this.compareAtPrice,
      this.availableForSale,
      this.image,
      this.quantityAvailable});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    compareAtPrice = json['compareAtPrice'];
    availableForSale = json['availableForSale'];
    image = json['image'];
    quantityAvailable = json['quantityAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['compareAtPrice'] = this.compareAtPrice;
    data['availableForSale'] = this.availableForSale;
    data['image'] = this.image;
    data['quantityAvailable'] = this.quantityAvailable;
    return data;
  }
}

 */
