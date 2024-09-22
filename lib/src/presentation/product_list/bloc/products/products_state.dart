part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  void when({
    void Function(ProductsInitial state)? onInitial,
    void Function(ProductsLoading state)? onLoading,
    void Function(ProductsFailed state)? onFailed,
    void Function(ProductsSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is ProductsInitial) {
      onInitial?.call(state);
    } else if (state is ProductsLoading) {
      onLoading?.call(state);
    } else if (state is ProductsFailed) {
      onFailed?.call(state);
    } else if (state is ProductsSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(ProductsInitial state)? onInitial,
    Widget Function(ProductsLoading state)? onLoading,
    Widget Function(ProductsFailed state)? onFailed,
    Widget Function(ProductsSuccess state)? onSuccess,
    Widget Function(ProductsState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is ProductsInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is ProductsLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is ProductsFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is ProductsSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class ProductsInitial extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {
  ProductsLoading(this.body, this.extra);

  final ProductsBody body;
  final dynamic extra;

  @override
  List<Object?> get props => [body, extra];
}

class ProductsSuccess extends ProductsState {
  ProductsSuccess(this.body, this.data, this.extra);

  final ProductsBody body;
  final List<ProductEntity> data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, data, extra];
}

class ProductsFailed extends ProductsState {
  ProductsFailed(this.body, this.failure, this.extra);

  final ProductsBody body;
  final DemoFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, failure, extra];
}
