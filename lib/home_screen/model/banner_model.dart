import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
    BannerModel({
        required this.banner,
    });

    List<Banner> banner;

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
    };
}

class Banner {
    Banner({
        required this.id,
        required this.highlight,
        required this.description,
        required this.couponName,
        required this.expiresAt,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String id;
    String highlight;
    String description;
    String couponName;
    int expiresAt;
    List<Image> image;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["_id"],
        highlight: json["highlight"],
        description: json["description"],
        couponName: json["couponName"],
        expiresAt: json["expiresAt"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "highlight": highlight,
        "description": description,
        "couponName": couponName,
        "expiresAt": expiresAt,
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
