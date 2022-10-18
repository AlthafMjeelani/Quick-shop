class ProductModel {
  final String name;
  final String image;
  final num price;
  final String description;
  final List<num> size;
  final bool isfavour;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.size,
    required this.isfavour,
  });
}
