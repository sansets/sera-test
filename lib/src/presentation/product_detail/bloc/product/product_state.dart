part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  void when({
    void Function(ProductInitial state)? onInitial,
    void Function(ProductLoading state)? onLoading,
    void Function(ProductFailed state)? onFailed,
    void Function(ProductSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is ProductInitial) {
      onInitial?.call(state);
    } else if (state is ProductLoading) {
      onLoading?.call(state);
    } else if (state is ProductFailed) {
      onFailed?.call(state);
    } else if (state is ProductSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(ProductInitial state)? onInitial,
    Widget Function(ProductLoading state)? onLoading,
    Widget Function(ProductFailed state)? onFailed,
    Widget Function(ProductSuccess state)? onSuccess,
    Widget Function(ProductState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is ProductInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is ProductLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is ProductFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is ProductSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  ProductLoading(this.body, this.extra);

  final ProductBody body;
  final dynamic extra;

  @override
  List<Object?> get props => [body, extra];
}

class ProductSuccess extends ProductState {
  ProductSuccess(this.body, this.data, this.extra);

  final ProductBody body;
  final ProductEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, data, extra];
}

class ProductFailed extends ProductState {
  ProductFailed(this.body, this.failure, this.extra);

  final ProductBody body;
  final DemoFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, failure, extra];
}
