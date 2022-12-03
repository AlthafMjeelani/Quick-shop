// class HomeCategoryModel {
//   HomeCategoryModel({
//     this.categoryName,
//     this.image,
//     this.id,
//   });

//   int? id;
//   String? categoryName;
//   String? image;

//   factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
//     return HomeCategoryModel(
//       categoryName: json['category'] ?? 'No Category Name',
//       image: json['icon'] ?? "Image Not found",
//       id: json['_id'] ?? 0,
//     );
//   }

// }

class HomeCategoryModel {
    HomeCategoryModel({
        this.id,
        this.category,
        this.icon,
        this.categorytModelId,
        this.subCategories,
    });

    String? id;
    String? category;
    String? icon;
    int? categorytModelId;
    List<SubCategory>? subCategories;

    factory HomeCategoryModel.fromJson(Map<String, dynamic> json) => HomeCategoryModel(
        id: json["_id"],
        category: json["category"],
        icon: json["icon"],
        categorytModelId: json["id"],
        subCategories: List<SubCategory>.from(json["subCategories"].map((x) => SubCategory.fromJson(x))),
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

