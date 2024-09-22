import 'package:equatable/equatable.dart';
import 'package:sera_test/src/domain/entities/cart_entity.dart';

class CartState extends Equatable {
  const CartState({
    required this.cart,
  });

  final CartEntity? cart;

  CartState copyWith({
    CartEntity? cart,
  }) {
    return CartState(
      cart: cart ?? this.cart,
    );
  }

  @override
  List<Object?> get props => [
        cart,
      ];
}
