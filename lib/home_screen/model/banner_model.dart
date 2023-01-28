class BannerModel {
  String? sId;
  String? highlight;
  String? description;
  String? couponName;
  String? expiresAt;
  List<Image>? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BannerModel(
      {this.sId,
      this.highlight,
      this.description,
      this.couponName,
      this.expiresAt,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BannerModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    highlight = json['highlight'];
    description = json['description'];
    couponName = json['couponName'];
    expiresAt = json['expiresAt'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['highlight'] = this.highlight;
    data['description'] = this.description;
    data['couponName'] = this.couponName;
    data['expiresAt'] = this.expiresAt;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Image {
  String? url;
  String? filename;
  String? sId;

  Image({this.url, this.filename, this.sId});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    filename = json['filename'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['filename'] = this.filename;
    data['_id'] = this.sId;
    return data;
  }
}
