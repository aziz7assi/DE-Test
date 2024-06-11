import 'package:http/http.dart' as http;

class Changepasswordservice {
  static const String loginUrl =
      'http://testapi.alifouad91.com/api/user/changepassword';

  Future<Map<String, dynamic>> changepass(String token, String current_password,
      String password, String password_confirm) async {
    if (password.isNotEmpty && password != password_confirm) {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'password': password,
          'password_confirm': password_confirm,
          'current_password': current_password
        },
      );

      return {'statusCode': response.statusCode};
    } else
      return {'statusCode': 500};
  }
}
