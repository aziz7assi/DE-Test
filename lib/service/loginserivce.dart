import 'dart:convert';
import 'package:detest/model/usermoder.dart';
import 'package:http/http.dart' as http;

class LoginApiService {
  static const String loginUrl = 'http://testapi.alifouad91.com/api/login';

  Future<Map<String, dynamic>> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      return {
        'statusCode': 500,
        'message': 'Username and password are required'
      };
    }

    final response = await http.post(
      Uri.parse(loginUrl),
      body: {'email': username, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data != null && data['success'] == true) {
        return {
          'statusCode': response.statusCode,
          'data': User.fromJson(data['data'])
        };
      } else {
        return {'statusCode': response.statusCode, 'message': data['message']};
      }
    } else {
      return {'statusCode': response.statusCode, 'message': 'message'};
    }
  }
}
