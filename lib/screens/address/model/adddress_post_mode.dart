class AddressPostModel {
  String? address;
  String? city;
  String? pincode;
  String? phone;
  String? name;

  AddressPostModel({
    this.address,
    this.pincode,
    this.city,
    this.name,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        "address": address,
        "pincode": pincode,
        "city": city,
        "phone": phone,
        "name": name,
      };
}
