import 'dart:convert';



String addCarsModelToJson(AddCarsModel data) => json.encode(data.toJson());

class AddCarsModel {
    AddCarsModel({
        this.name,
        this.rent,
        this.body,
        this.place,
        this.model,
        this.transmission,
        this.fuel,
        this.brand,
        this.description,
        this.image,
    });

    String? name;
    String? rent;
    String? body;
    String? place;
    String? model;
    String? transmission;
    String? fuel;
    String? brand;
    String? description;
    String? image;

    

    Map<String, dynamic> toJson() => {
        "name": name,
        "rent": rent,
        "body": body,
        "place": place,
        "model": model,
        "transmission": transmission,
        "fuel": fuel,
        "brand": brand,
        "description": description,
        "image": image,
    };
}