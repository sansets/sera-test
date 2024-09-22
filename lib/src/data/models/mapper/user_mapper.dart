import '../../../data/models/response/user_response.dart' as user_response;
import '../../../domain/entities/user_entity.dart' as user_entity;

extension ProductResponseMapper on user_response.UserResponse {
  user_entity.UserEntity toEntity() => user_entity.UserEntity(
        id: id,
        username: username,
        password: password,
      );
}
