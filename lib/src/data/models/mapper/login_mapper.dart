import '../../../data/models/response/login_response.dart' as login_response;
import '../../../domain/entities/login_entity.dart' as login_entity;

extension LoginResponseMapper
    on login_response.LoginResponse {
  login_entity.LoginEntity toEntity() =>
      login_entity.LoginEntity(
        token: token.toString(),
      );
}
