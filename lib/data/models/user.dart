import 'dart:convert';

class User {
  final String id;
  final String email;
  final String? password;
  final String name;
  final String? phone;
  User({
    required this.id,
    required this.email,
    this.password,
    required this.name,
    this.phone,
  });

  User copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      password: map['password'],
      name: map['name'] ?? '',
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, password: $password, name: $name, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.email == email &&
        other.password == password &&
        other.name == name &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        password.hashCode ^
        name.hashCode ^
        phone.hashCode;
  }
}
