class CartModel {
  final String? productId;
  final dynamic size;
  final num? quantity;
  final String? color;

  CartModel({
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

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      quantity: json['quantity'],
      color: json['color'],
      size: json['size'],
    );
  }
}
