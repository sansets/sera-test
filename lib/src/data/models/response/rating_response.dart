import 'package:equatable/equatable.dart';

class RatingResponse extends Equatable {
  const RatingResponse({
    required this.rate,
    required this.count,
  });

  final double? rate;
  final int? count;

  factory RatingResponse.fromMap(Map<String, dynamic> map) {
    return RatingResponse(
      rate: double.tryParse(map['rate']?.toString() ?? ''),
      count: int.tryParse(map['count']?.toString() ?? ''),
    );
  }

  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}
