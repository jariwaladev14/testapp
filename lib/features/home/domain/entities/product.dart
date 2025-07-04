class Product {
  String? id;
  String? title;
  String? description;
  String? productType;
  String? vendor;
  String? handle;
  // List<Options>? options;
  // List<String>? tags;
  // List<String>? images;
  // List<Variants>? variants;
  int? totalInventory;

  Product({
    this.id,
    this.title,
    this.description,
    this.productType,
    this.vendor,
    this.handle,
    // this.options,
    // this.tags,
    // this.images,
    // this.variants,
    this.totalInventory,
  });
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['values'] = values;
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

  Variants({
    this.id,
    this.title,
    this.price,
    this.compareAtPrice,
    this.availableForSale,
    this.image,
    this.quantityAvailable,
  });

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    compareAtPrice = json['compareAtPrice'];
    availableForSale = json['availableForSale'];
    image = json['image'];
    quantityAvailable = json['quantityAvailable'];
  }
}
