// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    String id;
    int usersId;
    String email;
    String password;
    String firstName;
    String lastName;
    String address;

    Users({
        this.id,
        this.usersId,
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.address,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["_id"],
        usersId: json["id"],
        email: json["email"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": usersId,
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
    };
}
