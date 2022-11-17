class HomeCategoryModel {
  HomeCategoryModel({
    this.categoryName,
    this.image,
    this.id,
  });

  int? id;
  String? categoryName;
  String? image;

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      categoryName: json['category'] ?? 'No Category Name',
      image: json['icon'] ?? "Image Not found",
      id: json['id'] ?? 0,
    );
  }
}
