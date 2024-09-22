import 'package:equatable/equatable.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';

class CartProductEntity extends Equatable {
  const CartProductEntity({
    required this.product,
    required this.quantity,
  });

  final ProductEntity? product;
  final String? quantity;

  @override
  List<Object?> get props => [
        product,
        quantity,
      ];
}
