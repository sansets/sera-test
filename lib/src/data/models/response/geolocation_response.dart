import 'package:equatable/equatable.dart';

class GeolocationResponse extends Equatable {
  const GeolocationResponse({
    required this.lat,
    required this.long,
  });

  final double? lat;
  final double? long;

  factory GeolocationResponse.fromMap(Map<String, dynamic> map) {
    return GeolocationResponse(
      lat: double.tryParse(map['lat']?.toString() ?? ''),
      long: double.tryParse(map['long']?.toString() ?? ''),
    );
  }

  @override
  List<Object?> get props => [
        lat,
        long,
      ];
}
