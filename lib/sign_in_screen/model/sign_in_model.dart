import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
    SignInModel({
        required this.mobileNumber,
        required this.password,
    });

    int mobileNumber;
    String password;

    factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        mobileNumber: json["mobileNumber"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "password": password,
    };
}
