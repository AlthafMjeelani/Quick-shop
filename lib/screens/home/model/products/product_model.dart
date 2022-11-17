class Products {
  Products({
    this.products,
  });

  List<ProductElement>? products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<ProductElement>.from(
          json["products"].map(
            (x) => ProductElement.fromJson(x),
          ),
        ),
      );
}

class ProductElement {
  ProductElement({
    this.category,
    this.id,
    this.name,
    this.price,
    this.size,
    this.colors,
    this.inventory,
    this.description,
    this.offer,
    this.ratings,
  });

  Category? category;
  String? id;
  String? name;
  int? price;
  List<dynamic>? size;
  List<Color>? colors;
  int? inventory;
  String? description;
  num? offer;
  List<dynamic>? ratings;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        category: Category.fromJson(json["category"]),
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        size: List<dynamic>.from(json["size"].map((x) => x)),
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        inventory: json["inventory"],
        description: json["description"],
        offer: json["offer"],
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
      );
}

class Category {
  Category({
    this.id,
  });

  String? id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
      );
}

class Color {
  Color({
    this.color,
    this.images,
    this.id,
  });

  String? color;
  List<dynamic>? images;
  String? id;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        color: json["color"],
        images: List<dynamic>.from(
          json["images"].map((x) => x),
        ),
        id: json["_id"],
      );
}
