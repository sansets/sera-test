import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.username,
    required this.password,
  });

  final String? id;
  final String? username;
  final String? password;

  @override
  List<Object?> get props => [
        id,
        username,
        password,
      ];
}
