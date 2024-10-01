import 'package:equatable/equatable.dart';

class CartProductResponse extends Equatable {
  const CartProductResponse({
    required this.productId,
    required this.quantity,
  });

  final String? productId;
  final String? quantity;

  factory CartProductResponse.fromMap(Map<String, dynamic> map) {
    return CartProductResponse(
      productId: map['productId']?.toString() ?? '',
      quantity: map['quantity']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [
        productId,
        quantity,
      ];
}
