import 'package:fake_store_app/core/api/end_point.dart';

class UserModel {
  final int? id;
  final String email;
  final String username;
  final String? password;
  final UserName name;
  final UserAddress address;
  final String phone;

  UserModel({
    this.id,
    required this.email,
    required this.username,
    this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKeys.id],
      email: json[ApiKeys.email],
      username: json[ApiKeys.username],
      password: json[ApiKeys.password],
      name: UserName.fromJson(json[ApiKeys.name]),
      address: UserAddress.fromJson(json[ApiKeys.address]),
      phone: json[ApiKeys.phone],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.id: id,
      ApiKeys.email: email,
      ApiKeys.username: username,
      ApiKeys.password: password,
      ApiKeys.name: name.toJson(),
      ApiKeys.address: address.toJson(),
      ApiKeys.phone: phone,
    };
  }
}

class UserName {
  final String firstname;
  final String lastname;

  UserName({required this.firstname, required this.lastname});

  factory UserName.fromJson(Map<String, dynamic> json) {
    return UserName(
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }
}

class UserAddress {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final GeoLocation geolocation;

  UserAddress({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      city: json['city'],
      street: json['street'],
      number: json['number'],
      zipcode: json['zipcode'],
      geolocation: GeoLocation.fromJson(json['geolocation']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
      'geolocation': geolocation.toJson(),
    };
  }
}

class GeoLocation {
  final String lat;
  final String long;

  GeoLocation({required this.lat, required this.long});

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      lat: json['lat'],
      long: json['long'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'long': long,
    };
  }
}
