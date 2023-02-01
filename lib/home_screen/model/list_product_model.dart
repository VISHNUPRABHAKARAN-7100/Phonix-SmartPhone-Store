class ProductModel {
  List<Products>? products;

  ProductModel({this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(  Products.fromJson(v));
      });
    }
  }
}

class Products {
  String? sId;
  String? productname;
  int? price;
  int? mrp;
  int? stock;
  String? brand;
  String? category;
  String? description;
  bool? isDeleted;
  List<ImageModel>? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Products(
      {this.sId,
      this.productname,
      this.price,
      this.mrp,
      this.stock,
      this.brand,
      this.category,
      this.description,
      this.isDeleted,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productname = json['productname'];
    price = json['price'];
    mrp = json['mrp'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    description = json['description'];
    isDeleted = json['isDeleted'];
    if (json['image'] != null) {
      image = <ImageModel>[];
      json['image'].forEach((v) {
        image!.add(  ImageModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }


}

class ImageModel {
  String? url;
  String? filename;
  String? sId;

  ImageModel({this.url, this.filename, this.sId});

  ImageModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    filename = json['filename'];
    sId = json['_id'];
  }
}

