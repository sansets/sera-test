import 'package:equatable/equatable.dart';
import 'package:sera_test/src/domain/entities/user_entity.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.users,
    required this.isLoginButtonEnabled,
  });

  final List<UserEntity> users;
  final bool isLoginButtonEnabled;

  SignInState copyWith({
    List<UserEntity>? users,
    bool? isLoginButtonEnabled,
  }) {
    return SignInState(
      users: users ?? this.users,
      isLoginButtonEnabled: isLoginButtonEnabled ?? this.isLoginButtonEnabled,
    );
  }

  @override
  List<Object?> get props => [
        users,
        isLoginButtonEnabled,
      ];
}
