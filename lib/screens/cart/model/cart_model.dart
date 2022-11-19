class CartModel {
  final String? productId;
  final dynamic size;
  final num? quantity;
  final String? color;

  CartModel(
    this.productId,
    this.size,
    this.quantity,
    this.color,
  );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "size": size,
        "quantity": quantity,
        "color": color,
      };
}
