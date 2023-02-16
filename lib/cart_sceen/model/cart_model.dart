import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    CartModel({
        required this.cart,
    });

    Cart cart;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cart: Cart.fromJson(json["cart"]),
    );

    Map<String, dynamic> toJson() => {
        "cart": cart.toJson(),
    };
}

class Cart {
    Cart({
        required this.id,
        required this.userId,
        required this.cartItems,
        required this.discount,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String id;
    String userId;
    List<CartItem> cartItems;
    List<dynamic> discount;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        userId: json["userId"],
        cartItems: List<CartItem>.from(json["cartItems"].map((x) => CartItem.fromJson(x))),
        discount: List<dynamic>.from(json["discount"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
        "discount": List<dynamic>.from(discount.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class CartItem {
    CartItem({
        required this.productId,
        required this.productQuantity,
        required this.id,
    });

    ProductId productId;
    int productQuantity;
    String id;

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productId: ProductId.fromJson(json["productId"]),
        productQuantity: json["productQuantity"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId.toJson(),
        "productQuantity": productQuantity,
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
