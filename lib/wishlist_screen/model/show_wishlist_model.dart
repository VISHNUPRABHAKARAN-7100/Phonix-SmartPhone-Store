import 'dart:convert';

ShowWishListModel showWishListModelFromJson(String str) => ShowWishListModel.fromJson(json.decode(str));

String showWishListModelToJson(ShowWishListModel data) => json.encode(data.toJson());

class ShowWishListModel {
    ShowWishListModel({
        required this.wishlist,
    });

    Wishlist wishlist;

    factory ShowWishListModel.fromJson(Map<String, dynamic> json) => ShowWishListModel(
        wishlist: Wishlist.fromJson(json["wishlist"]),
    );

    Map<String, dynamic> toJson() => {
        "wishlist": wishlist.toJson(),
    };
}

class Wishlist {
    Wishlist({
        required this.id,
        required this.userId,
        required this.items,
        required this.v,
    });

    String id;
    String userId;
    List<Item> items;
    int v;

    factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["_id"],
        userId: json["userId"],
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
        "__v": v,
    };
}

class Item {
    Item({
        required this.productId,
        required this.id,
    });

    ProductId productId;
    String id;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: ProductId.fromJson(json["productId"]),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId.toJson(),
        "_id": id,
    };
}

class ProductId {
    ProductId({
        required this.id,
        required this.productname,
        required this.price,
        required this.mrp,
        required this.stock,
        required this.brand,
        required this.category,
        required this.description,
        required this.isDeleted,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String id;
    String productname;
    int price;
    int mrp;
    int stock;
    String brand;
    String category;
    String description;
    bool isDeleted;
    List<Image> image;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        productname: json["productname"],
        price: json["price"],
        mrp: json["mrp"],
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        description: json["description"],
        isDeleted: json["isDeleted"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productname": productname,
        "price": price,
        "mrp": mrp,
        "stock": stock,
        "brand": brand,
        "category": category,
        "description": description,
        "isDeleted": isDeleted,
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Image {
    Image({
        required this.url,
        required this.filename,
        required this.id,
    });

    String url;
    String filename;
    String id;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        filename: json["filename"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "filename": filename,
        "_id": id,
    };
}
