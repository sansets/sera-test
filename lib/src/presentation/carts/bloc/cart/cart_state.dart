part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  void when({
    void Function(CartInitial state)? onInitial,
    void Function(CartLoading state)? onLoading,
    void Function(CartFailed state)? onFailed,
    void Function(CartSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is CartInitial) {
      onInitial?.call(state);
    } else if (state is CartLoading) {
      onLoading?.call(state);
    } else if (state is CartFailed) {
      onFailed?.call(state);
    } else if (state is CartSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(CartInitial state)? onInitial,
    Widget Function(CartLoading state)? onLoading,
    Widget Function(CartFailed state)? onFailed,
    Widget Function(CartSuccess state)? onSuccess,
    Widget Function(CartState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is CartInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is CartLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is CartFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is CartSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {
  CartLoading(this.body, this.extra);

  final CartsBody body;
  final dynamic extra;

  @override
  List<Object?> get props => [body, extra];
}

class CartSuccess extends CartState {
  CartSuccess(this.body, this.data, this.extra);

  final CartsBody body;
  final CartEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, data, extra];
}

class CartFailed extends CartState {
  CartFailed(this.body, this.failure, this.extra);

  final CartsBody body;
  final DemoFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, failure, extra];
}
