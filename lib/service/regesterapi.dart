import 'dart:convert';
import 'package:detest/model/usermoder.dart';
import 'package:http/http.dart' as http;

class RegesterapiService {
  static const String Url = 'http://testapi.alifouad91.com/api/user/register';

  Future<Map<String, dynamic>> Regrster(String name, String email, String phone,
      String password, String country_code, String password_confirm) async {
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
      return {'statusCode': 500, 'message': 'All fields are required'};
    }

    if (password != password_confirm) {
      return {'statusCode': 501, 'message': 'Passwords do not match'};
    }

    try {
      final response = await http.post(
        Uri.parse(Url),
        body: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'country_code': country_code,
          'password_confirm': password_confirm,
        },
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (data != null && data['success'] == true) {
          return {
            'statusCode': response.statusCode,
            'user': User.fromJson(data['data'])
          };
        } else {
          return {
            'statusCode': response.statusCode,
            'message': data['message'] ?? 'Registration failed'
          };
        }
      } else {
        return {'statusCode': response.statusCode, 'message': data['message']};
      }
    } catch (e) {
      return {'statusCode': 500, 'message': 'Server error: $e'};
    }
  }
}
