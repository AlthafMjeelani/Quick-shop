class CartPostModel {
  final String? productId;
  final dynamic size;
  final num? quantity;
  final String? color;

  CartPostModel({
    this.productId,
    this.size,
    this.quantity,
    this.color,
  });

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "size": size,
        "quantity": quantity,
        "color": color,
      };
}
