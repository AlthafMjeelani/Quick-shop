class RemoveWishlistModel {
    RemoveWishlistModel({
        this.success,
        this.message,
    });

    bool? success;
    String? message;

    factory RemoveWishlistModel.fromJson(Map<String, dynamic> json) => RemoveWishlistModel(
        success: json["success"],
        message: json["message"],
    );
}
