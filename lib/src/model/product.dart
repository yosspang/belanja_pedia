// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
    String id;
    int productId;
    String image;
    String name;
    int price;
    String description;
    int stock;

    Products({
        this.id,
        this.productId,
        this.image,
        this.name,
        this.price,
        this.description,
        this.stock,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["_id"],
        productId: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        stock: json["stock"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": productId,
        "image": image,
        "name": name,
        "price": price,
        "description": description,
        "stock": stock,
    };
}
