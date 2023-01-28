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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
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
  List<Image>? image;
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
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(  Image.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   Map<String, dynamic>();
    data['_id'] = this.sId;
    data['productname'] = this.productname;
    data['price'] = this.price;
    data['mrp'] = this.mrp;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['description'] = this.description;
    data['isDeleted'] = this.isDeleted;
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
    final Map<String, dynamic> data =   Map<String, dynamic>();
    data['url'] = this.url;
    data['filename'] = this.filename;
    data['_id'] = this.sId;
    return data;
  }
}


// class Product {
//   Product({
//     this.products,
//   });
//   Product.fromJson(dynamic json) {
//     if (json['products'] != null) {
//       products = [];
//       json['products'].forEach((v) {
//         products?.add(Products.fromJson(v));
//       });
//     }
//   }
//   List<Products>? products;
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (products != null) {
//       map['products'] = products?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }

// class Products {
//   Products({
//     this.id,
//     this.productname,
//     this.price,
//     this.mrp,
//     this.stock,
//     this.brand,
//     this.category,
//     this.description,
//     this.isDeleted,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });
//   Products.fromJson(dynamic json) {
//     id = json['_id'];
//     productname = json['productname'];
//     price = json['price'];
//     mrp = json['mrp'];
//     stock = json['stock'];
//     brand = json['brand'];
//     category = json['category'];
//     description = json['description'];
//     isDeleted = json['isDeleted'];
//     if (json['image'] != null) {
//       image = [];
//       json['image'].forEach((v) {
//         image?.add(Image.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     v = json['__v'];
//   }
//   String? id;
//   String? productname;
//   int? price;
//   int? mrp;
//   int? stock;
//   String? brand;
//   String? category;
//   String? description;
//   bool? isDeleted;
//   List<Image>? image;
//   String? createdAt;
//   String? updatedAt;
//   int? v;
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['productname'] = productname;
//     map['price'] = price;
//     map['mrp'] = mrp;
//     map['stock'] = stock;
//     map['brand'] = brand;
//     map['category'] = category;
//     map['description'] = description;
//     map['isDeleted'] = isDeleted;
//     if (image != null) {
//       map['image'] = image?.map((v) => v.toJson()).toList();
//     }
//     map['createdAt'] = createdAt;
//     map['updatedAt'] = updatedAt;
//     map['__v'] = v;
//     return map;
//   }
// }

// class Image {
//   Image({
//     this.url,
//     this.filename,
//     this.id,
//   });
//   Image.fromJson(dynamic json) {
//     url = json['url'];
//     filename = json['filename'];
//     id = json['_id'];
//   }
//   String? url;
//   String? filename;
//   String? id;
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['url'] = url;
//     map['filename'] = filename;
//     map['_id'] = id;
//     return map;
//   }
// }
