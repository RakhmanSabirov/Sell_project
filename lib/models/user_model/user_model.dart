import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.image,
    required this.id,
    required this.name,
    required this.email,
    required this.lastName,
    required this.city,
    required this.address,
    required this.phone

  });

  String? image;
  String name;
  String email;
  String lastName;
  String city;
  String address;
  String phone;

  String id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    image: json["image"],
    email: json["email"],
    name: json["name"],
    lastName: json["lastName"],
    city: json["city"],
    address : json["address"],
    phone : json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "email": email,
    "lastName" : lastName,
    "city" : city,
    "address" : address,
    "phone" : phone,
  };

  UserModel copyWith({
    String? name,
    String? lastName,
    String? city,
    String? address,
    String? phone,
    image,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email,
        lastName: lastName ?? this.lastName,
        city: city ?? this.city,
        address:address ?? this.address,
        image: image ?? this.image,
        phone: phone ?? this.phone,
      );
}
