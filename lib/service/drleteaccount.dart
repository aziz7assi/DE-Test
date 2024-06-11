import 'package:http/http.dart' as http;

class deleteservice {
  static const String loginUrl =
      'http://testapi.alifouad91.com/api/user/delete';

  Future<Map<String, dynamic>> delete(String token) async {
    final response = await http.delete(
      Uri.parse(loginUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    return {'statusCode': response.statusCode};
  }
}
