import 'dart:convert';

AdminLoginModel adminLoginModelFromJson(String str) =>
    AdminLoginModel.fromJson(jsonDecode(str));

String adminLoginModelToJson(AdminLoginModel data) =>
    json.encode(data.toJson());

class AdminLoginModel {
  String? userName;
  String? password;
  String? sId;
  String? token;

  AdminLoginModel({
    this.password,
    this.sId,
    this.token,
    this.userName,
  });

  factory AdminLoginModel.fromJson(Map<String, dynamic> json) =>
      AdminLoginModel(
        userName: json["userName"],
        sId: json["_id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
      };
}
