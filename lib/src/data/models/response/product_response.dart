import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sera_test/src/data/models/response/rating_response.dart';

class ProductResponse extends Equatable {
  const ProductResponse({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });

  final String? id;
  final String? title;
  final double? price;
  final String? category;
  final String? description;
  final String? image;
  final RatingResponse? rating;

  factory ProductResponse.fromMap(Map<String, dynamic> map) {
    return ProductResponse(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      price: double.tryParse(map['price']?.toString() ?? '') ?? 0,
      category: map['category']?.toString() ?? '',
      description: map['description']?.toString() ?? '',
      image: map['image']?.toString() ?? '',
      rating:
          map['rating'] == null ? null : RatingResponse.fromMap(map['rating']),
    );
  }

  factory ProductResponse.fromJson(String source) =>
      ProductResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        category,
        description,
        image,
        rating,
      ];
}
