import 'package:sera_test/src/data/models/mapper/rating_mapper.dart';

import '../../../data/models/response/product_response.dart'
    as product_response;
import '../../../domain/entities/product_entity.dart' as product_entity;

extension ProductResponseMapper on product_response.ProductResponse {
  product_entity.ProductEntity toEntity() => product_entity.ProductEntity(
        id: id,
        title: title,
        price: price?.toDouble(),
        category: category,
        description: description,
        image: image,
        rating: rating?.toEntity(),
      );
}
