import 'dart:convert';

class UserModel {
  final String id;
  final String email;

  static const int minPasswordLength = 8;

  UserModel({
    required this.id,
    required this.email
  });

  Map<String, String> toMap() {
    return {
      'id': id,
      'email': email
    };
  }

  factory UserModel.fromMap(Map map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? ''
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(Map json) => UserModel
      .fromMap(json);

  UserModel copyWith({
    String? id,
    String? email
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email
    );
  }

}
