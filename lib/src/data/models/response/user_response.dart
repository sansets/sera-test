import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sera_test/src/data/models/response/address_response.dart';
import 'package:sera_test/src/data/models/response/name_response.dart';

class UserResponse extends Equatable {
  const UserResponse({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  final String? id;
  final String? email;
  final String? username;
  final String? password;
  final NameResponse? name;
  final AddressResponse? address;
  final String? phone;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name,
      'address': address,
      'phone': phone,
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      id: map['id']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      username: map['username']?.toString() ?? '',
      password: map['password']?.toString() ?? '',
      name: map['name'] == null ? null : NameResponse.fromMap(map['name']),
      address: map['address'] == null
          ? null
          : AddressResponse.fromMap(map['address']),
      phone: map['phone']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        email,
        username,
        password,
        name,
        address,
        phone,
      ];
}
