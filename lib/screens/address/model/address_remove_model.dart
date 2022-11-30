class AddressRemoveModel {
    AddressRemoveModel({
        this.success,
        this.message,
    });

    bool? success;
    String? message;

    factory AddressRemoveModel.fromJson(Map<String, dynamic> json) => AddressRemoveModel(
        success: json["success"],
        message: json["message"],
    );
}
