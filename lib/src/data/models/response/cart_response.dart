import 'package:equatable/equatable.dart';
import 'package:sera_test/src/data/models/response/cart_product_response.dart';

class CartResponse extends Equatable {
  const CartResponse({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  final int? id;
  final int? userId;
  final String? date;
  final List<CartProductResponse>? products;

  factory CartResponse.fromMap(Map<String, dynamic> map) {
    return CartResponse(
        id: int.tryParse(map['id']?.toString() ?? ''),
        userId: int.tryParse(map['userId']?.toString() ?? ''),
        date: map['date']?.toString(),
        products: List.from(
            map['products'].map((e) => CartProductResponse.fromMap(e))));
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        date,
        products,
      ];
}
