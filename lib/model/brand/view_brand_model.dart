
import 'dart:convert';

List<ViewBrandModel> viewBrandModelFromJson(String str) => List<ViewBrandModel>.from(json.decode(str).map((x) => ViewBrandModel.fromJson(x)));

String viewBrandModelToJson(List<ViewBrandModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewBrandModel {
    ViewBrandModel({
        this.id,
        this.brand,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? brand;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory ViewBrandModel.fromJson(Map<String, dynamic> json) => ViewBrandModel(
        id: json["_id"],
        brand: json["brand"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "brand": brand,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
