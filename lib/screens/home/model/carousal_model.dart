class CarousalsModel {
  CarousalsModel({
    this.carousals,
    this.message,
  });

  List<Carousal>? carousals;
  String? message;

  factory CarousalsModel.fromJson(Map<String, dynamic> json) => CarousalsModel(
        carousals: List<Carousal>.from(
            json["carousals"].map((x) => Carousal.fromJson(x))),
        message: json["message"],
      );
}

class Carousal {
  Carousal({
    this.id,
    this.title,
    this.image,
    this.description,
    this.offer,
  });

  String? id;
  String? title;
  String? image;
  String? description;
  int? offer;

  factory Carousal.fromJson(Map<String, dynamic> json) => Carousal(
        id: json["_id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        offer: json["offer"],
      );
}
