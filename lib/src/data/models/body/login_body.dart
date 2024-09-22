import 'package:equatable/equatable.dart';

class LoginBody extends Equatable {
  const LoginBody({
    this.username,
    this.password,
  });

  final String? username;
  final String? password;

  Map<String, dynamic> toMap() {
    return {
      if (username != null) 'username': username,
      if (password != null) 'password': password,
    };
  }

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
