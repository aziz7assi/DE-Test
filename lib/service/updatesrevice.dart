import 'dart:convert';
import 'package:http/http.dart' as http;

class Updatesrevice {
  static const String Url = 'http://testapi.alifouad91.com/api/user/update';

  Future<Map<String, dynamic>> Update(
    String currentName,
    String currentEmail,
    String currentPhone,
    String currentCountryCode,
    String? newName,
    String? newEmail,
    String? newPhone,
    String? newCountryCode,
    String token,
  ) async {
    Map<String, String> body = {};

    if (newName != null && newName.isNotEmpty && newName != currentName) {
      body['name'] = newName;
    }
    if (newEmail != null && newEmail.isNotEmpty && newEmail != currentEmail) {
      body['email'] = newEmail;
    }
    if (newPhone != null && newPhone.isNotEmpty && newPhone != currentPhone) {
      body['phone'] = newPhone;
    }
    if (newCountryCode != null &&
        newCountryCode.isNotEmpty &&
        newCountryCode != currentCountryCode) {
      body['country_code'] = newCountryCode;
    }

    if (body.isEmpty) {
      return {'statusCode': 500, 'data': 'No data to update'};
    }

    final response = await http.post(
      Uri.parse(Url),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: body,
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      {
        return {
          'statusCode': response.statusCode,
        };
      }
    } else
      return {'statusCode': response.statusCode, 'data': data['message']};
  }
}
