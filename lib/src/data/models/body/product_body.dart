import 'package:equatable/equatable.dart';

class ProductBody extends Equatable {
  const ProductBody({
    this.id,
  });

  final String? id;

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
    };
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
