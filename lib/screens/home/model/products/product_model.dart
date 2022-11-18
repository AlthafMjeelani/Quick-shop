class Products {
  Products({
    this.products,
    this.count,
  });

  List<ProductElement>? products;
  int? count;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        count: json["count"],
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
  int? offer;
  List<dynamic>? ratings;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        category: Category.fromJson(json["category"]),
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        size: List<String>.from(json["size"].map((x) => x)),
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

  Id? id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: Id.fromJson(json["id"]),
      );
}

class Id {
  Id({
    this.id,
    this.category,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.idId,
    this.subCategories,
  });

  String? id;
  String? category;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? idId;
  List<SubCategory>? subCategories;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        id: json["_id"],
        category: json["category"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        idId: json["id"],
        subCategories: List<SubCategory>.from(
            json["subCategories"].map((x) => SubCategory.fromJson(x))),
      );
}

class SubCategory {
  SubCategory({
    this.name,
    this.id,
  });

  String? name;
  String? id;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        name: json["name"],
        id: json["_id"],
      );
}

class Color {
  Color({
    this.color,
    this.images,
    this.id,
  });

  String? color;
  List<String>? images;
  String? id;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        color: json["color"],
        images: List<String>.from(json["images"].map((x) => x)),
        id: json["_id"],
      );
}
