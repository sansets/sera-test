import 'package:equatable/equatable.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    required this.product,
  });

  final ProductEntity? product;

  ProductDetailState copyWith({
    ProductEntity? product,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [
        product,
      ];
}
