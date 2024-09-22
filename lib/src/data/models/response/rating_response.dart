import 'dart:convert';

import 'package:equatable/equatable.dart';

class RatingResponse extends Equatable {
  const RatingResponse({
    required this.rate,
    required this.count,
  });

  final double? rate;
  final int? count;

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  factory RatingResponse.fromMap(Map<String, dynamic> map) {
    return RatingResponse(
      rate: double.tryParse(map['rate']?.toString() ?? ''),
      count: int.tryParse(map['count']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingResponse.fromJson(String source) =>
      RatingResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}
