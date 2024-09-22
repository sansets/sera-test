part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {}

class FetchCart extends CartEvent {
  FetchCart(this.body, {this.extra});

  final CartsBody body;
  final dynamic extra;

  @override
  List<Object?> get props => [body, extra];
}
