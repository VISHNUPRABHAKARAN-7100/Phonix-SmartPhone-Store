import 'dart:convert';

SignUpModel? signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel? data) => json.encode(data!.toJson());

class SignUpModel {
    SignUpModel({
        this.name,
        this.email,
        this.mobileNumber,
        this.password,
        this.isVerified,
        this.status,
        this.isBlocked,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? name;
    String? email;
    int? mobileNumber;
    String? password;
    bool? isVerified;
    String? status;
    bool? isBlocked;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        name: json["name"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        password: json["password"],
        isVerified: json["isVerified"],
        status: json["status"],
        isBlocked: json["isBlocked"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobileNumber": mobileNumber,
        "password": password,
        "isVerified": isVerified,
        "status": status,
        "isBlocked": isBlocked,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
