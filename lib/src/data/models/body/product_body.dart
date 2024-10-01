import 'package:equatable/equatable.dart';

class ProductBody extends Equatable {
  const ProductBody({
    this.id,
  });

  final String? id;

  @override
  List<Object?> get props => [
        id,
      ];
}
