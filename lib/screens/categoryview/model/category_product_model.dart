class CategoryProductModel {
    CategoryProductModel({
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
    Category? category;
    int? price;
    List<String>? size;
    List<Color>? colors;
    int? inventory;
    String? description;
    int? offer;
    List<dynamic>? ratings;

    factory CategoryProductModel.fromJson(Map<String, dynamic> json) => CategoryProductModel(
        id: json["_id"],
        name: json["name"],
        category: Category.fromJson(json["category"]),
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
        this.category,
        this.icon,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
        this.subCategories,
    });

    String? id;
    String? category;
    String? icon;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? categoryId;
    List<SubCategory>? subCategories;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        category: json["category"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categoryId: json["id"],
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

    factory SubCategory.fromJson(Map<String?, dynamic> json) => SubCategory(
        name: json["name"],
        id: json["_id"],
    );

    Map<String?, dynamic> toJson() => {
        "name": name,
        "_id": id,
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

    factory Color.fromJson(Map<String?, dynamic> json) => Color(
        color: json["color"],
        images: List<String>.from(json["images"].map((x) => x)),
        id: json["_id"],
    );

   
}
