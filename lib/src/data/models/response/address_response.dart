import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sera_test/src/data/models/response/geolocation_response.dart';

class AddressResponse extends Equatable {
  const AddressResponse({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;
  final GeolocationResponse? geolocation;

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
      'geolocation': geolocation,
    };
  }

  factory AddressResponse.fromMap(Map<String, dynamic> map) {
    return AddressResponse(
      city: map['city']?.toString() ?? '',
      street: map['street']?.toString() ?? '',
      number: int.tryParse(map['number']?.toString() ?? ''),
      zipcode: map['zipcode']?.toString() ?? '',
      geolocation: map['rating'] == null
          ? null
          : GeolocationResponse.fromMap(map['geolocation']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressResponse.fromJson(String source) =>
      AddressResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        city,
        street,
        number,
        zipcode,
        geolocation,
      ];
}
