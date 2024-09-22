import 'dart:convert';

import 'package:equatable/equatable.dart';

class GeolocationResponse extends Equatable {
  const GeolocationResponse({
    required this.lat,
    required this.long,
  });

  final double? lat;
  final double? long;

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory GeolocationResponse.fromMap(Map<String, dynamic> map) {
    return GeolocationResponse(
      lat: double.tryParse(map['lat']?.toString() ?? ''),
      long: double.tryParse(map['long']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory GeolocationResponse.fromJson(String source) =>
      GeolocationResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        lat,
        long,
      ];
}
