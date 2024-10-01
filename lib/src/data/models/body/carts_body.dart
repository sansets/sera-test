import 'package:equatable/equatable.dart';

class CartsBody extends Equatable {
  const CartsBody({
    this.userId,
  });

  final String? userId;

  @override
  List<Object?> get props => [
        userId,
      ];
}
