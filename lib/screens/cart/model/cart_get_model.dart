class GetCartProductsModel {
  GetCartProductsModel({
    this.id,
    this.user,
    this.products,
  });

  String? id;
  String? user;
  List<ProductCartElement>? products;
  factory GetCartProductsModel.fromJson(Map<String, dynamic> json) =>
      GetCartProductsModel(
        id: json["_id"],
        user: json["user"],
        products: List<ProductCartElement>.from(
            json["products"].map((x) => ProductCartElement.fromJson(x))),
      );
}

class ProductCartElement {
  ProductCartElement({
    this.product,
    this.quantity,
    this.size,
    this.color,
    this.id,
  });

  ProductDetails? product;
  int? quantity;
  String? size;
  String? color;
  String? id;

  factory ProductCartElement.fromJson(Map<String, dynamic> json) => ProductCartElement(
        product: ProductDetails.fromJson(json["product"]),
        quantity: json["quantity"],
        size: json["size"],
        color: json["color"],
        id: json["_id"],
      );
}

class ProductDetails {
  ProductDetails({
    this.id,
    this.name,
    this.price,
    this.colors,
    this.inventory,
    this.description,
    this.offer,
    this.ratings,
  });

  String? id;
  String? name;
  num? price;
  List<Color>? colors;
  int? inventory;
  String? description;
  int? offer;
  List<dynamic>? ratings;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        inventory: json["inventory"],
        description: json["description"],
        offer: json["offer"],
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
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
