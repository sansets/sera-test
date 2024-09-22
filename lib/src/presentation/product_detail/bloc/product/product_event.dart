part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class FetchProduct extends ProductEvent {
  FetchProduct(this.body, {this.extra});

  final ProductBody body;
  final dynamic extra;

  @override
  List<Object?> get props => [body, extra];
}
