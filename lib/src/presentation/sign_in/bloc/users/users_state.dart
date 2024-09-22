part of 'users_bloc.dart';

@immutable
abstract class UsersState extends Equatable {
  void when({
    void Function(UsersInitial state)? onInitial,
    void Function(UsersLoading state)? onLoading,
    void Function(UsersFailed state)? onFailed,
    void Function(UsersSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is UsersInitial) {
      onInitial?.call(state);
    } else if (state is UsersLoading) {
      onLoading?.call(state);
    } else if (state is UsersFailed) {
      onFailed?.call(state);
    } else if (state is UsersSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(UsersInitial state)? onInitial,
    Widget Function(UsersLoading state)? onLoading,
    Widget Function(UsersFailed state)? onFailed,
    Widget Function(UsersSuccess state)? onSuccess,
    Widget Function(UsersState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is UsersInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is UsersLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is UsersFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is UsersSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class UsersInitial extends UsersState {
  @override
  List<Object?> get props => [];
}

class UsersLoading extends UsersState {
  UsersLoading(this.body, this.extra);

  final UsersBody body;
  final dynamic extra;

  @override
  List<Object?> get props => [body, extra];
}

class UsersSuccess extends UsersState {
  UsersSuccess(this.body, this.data, this.extra);

  final UsersBody body;
  final List<UserEntity> data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, data, extra];
}

class UsersFailed extends UsersState {
  UsersFailed(this.body, this.failure, this.extra);

  final UsersBody body;
  final DemoFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, failure, extra];
}
