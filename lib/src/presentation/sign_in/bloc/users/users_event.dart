part of 'users_bloc.dart';

@immutable
abstract class UsersEvent extends Equatable {}

class FetchUsers extends UsersEvent {
  FetchUsers(this.body, {this.extra});

  final UsersBody body;
  final dynamic extra;

  @override
  List<Object?> get props => [body, extra];
}
