import 'package:equatable/equatable.dart';
import 'package:sera_test/src/domain/entities/rating_entity.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
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
  final RatingEntity? rating;

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
