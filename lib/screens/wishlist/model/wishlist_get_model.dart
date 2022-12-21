class WishlistGetModel {
  WishlistGetModel({
    this.id,
    this.name,
    this.category,
    this.price,
    this.size,
    this.colors,
    this.inventory,
    this.description,
    this.offer,
    this.ratings,
  });

  String? id;
  String? name;
  dynamic category;
  dynamic price;
  List<dynamic>? size;
  List<Color>? colors;
  dynamic inventory;
  String? description;
  dynamic offer;
  List<dynamic>? ratings;

  factory WishlistGetModel.fromJson(Map<String, dynamic> json) =>
      WishlistGetModel(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        price: json["price"],
        size: List<dynamic>.from(json["size"].map((x) => x)),
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        inventory: json["inventory"],
        description: json["description"],
        offer: json["offer"],
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
      );
}

class CategoryClass {
  CategoryClass({
    this.id,
  });

  String? id;

  factory CategoryClass.fromJson(Map<String, dynamic> json) => CategoryClass(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
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
