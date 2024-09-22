import 'package:equatable/equatable.dart';
import 'package:sera_test/src/domain/entities/cart_product_entity.dart';

class CartEntity extends Equatable {
  const CartEntity({
    required this.id,
    required this.cartProducts,
  });

  final int? id;
  final List<CartProductEntity>? cartProducts;

  @override
  List<Object?> get props => [
        id,
        cartProducts,
      ];
}
