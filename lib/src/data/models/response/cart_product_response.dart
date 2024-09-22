import 'dart:convert';

import 'package:equatable/equatable.dart';

class CartProductResponse extends Equatable {
  const CartProductResponse({
    required this.productId,
    required this.quantity,
  });

  final String? productId;
  final String? quantity;

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory CartProductResponse.fromMap(Map<String, dynamic> map) {
    return CartProductResponse(
      productId: map['productId']?.toString() ?? '',
      quantity: map['quantity']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProductResponse.fromJson(String source) =>
      CartProductResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        productId,
        quantity,
      ];
}
