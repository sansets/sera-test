import 'dart:convert';

import 'package:equatable/equatable.dart';

class NameResponse extends Equatable {
  const NameResponse({
    required this.firstname,
    required this.lastname,
  });

  final String? firstname;
  final String? lastname;

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  factory NameResponse.fromMap(Map<String, dynamic> map) {
    return NameResponse(
      firstname: map['rate']?.toString() ?? '',
      lastname: map['count']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NameResponse.fromJson(String source) =>
      NameResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        firstname,
        lastname,
      ];
}
