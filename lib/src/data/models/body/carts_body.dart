import 'package:equatable/equatable.dart';

class CartsBody extends Equatable {
  const CartsBody({
    this.userId,
  });

  final String? userId;

  Map<String, dynamic> toMap() {
    return {
      if (userId != null) 'userId': userId,
    };
  }

  @override
  List<Object?> get props => [
        userId,
      ];
}
