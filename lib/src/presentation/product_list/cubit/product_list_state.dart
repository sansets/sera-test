import 'package:equatable/equatable.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';

class ProductListState extends Equatable {
  const ProductListState({
    required this.products,
  });

  final List<ProductEntity> products;

  ProductListState copyWith({
    List<ProductEntity>? products,
  }) {
    return ProductListState(
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        products,
      ];
}
