import 'package:equatable/equatable.dart';

class NameResponse extends Equatable {
  const NameResponse({
    required this.firstname,
    required this.lastname,
  });

  final String? firstname;
  final String? lastname;

  factory NameResponse.fromMap(Map<String, dynamic> map) {
    return NameResponse(
      firstname: map['firstname']?.toString() ?? '',
      lastname: map['lastname']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [
        firstname,
        lastname,
      ];
}
