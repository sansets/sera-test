part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {}

class FetchProducts extends ProductsEvent {
  FetchProducts(this.body, {this.extra});

  final ProductsBody body;
  final dynamic extra;

  @override
  List<Object?> get props => [body, extra];
}
