class AddressGetModel {
  AddressGetModel({
    this.address,
    this.city,
    this.pincode,
    this.phone,
    this.name,
    this.id,
  });

  String? address;
  String? city;
  int? pincode;
  int? phone;
  String? name;
  String? id;

  factory AddressGetModel.fromJson(Map<String, dynamic> json) =>
      AddressGetModel(
        address: json["address"],
        city: json["city"],
        pincode: json["pincode"],
        phone: json["phone"],
        name: json["name"],
        id: json["_id"],
      );
}
