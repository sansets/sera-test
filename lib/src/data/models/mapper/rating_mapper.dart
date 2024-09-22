import '../../../data/models/response/rating_response.dart' as rating_response;
import '../../../domain/entities/rating_entity.dart' as rating_entity;

extension ProductResponseMapper on rating_response.RatingResponse {
  rating_entity.RatingEntity toEntity() =>
      rating_entity.RatingEntity(rate: rate, count: count);
}
