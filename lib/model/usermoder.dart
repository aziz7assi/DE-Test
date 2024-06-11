class User {
  final String id;
  late String name;
  late String country_code;
  late String phone;
  late String email;
  final String token;
  final String token_expiry;

  User({
    required this.id,
    required this.name,
    required this.country_code,
    required this.email,
    required this.phone,
    required this.token,
    required this.token_expiry,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      country_code: json['country_code'],
      email: json['email'],
      phone: json['phone'],
      token: json['token'],
      token_expiry: json['token_expiry'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country_code': country_code,
      'phone': phone,
      'email': email,
      'token': token,
      'token_expiry': token_expiry,
    };
  }
}
