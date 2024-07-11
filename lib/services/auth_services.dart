import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_auth/api/api_data.dart';
import 'package:jwt_auth/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authservice {
  final client = http.Client();

  Future<UserModel?> login(String userName, String password) async {
    final Map<String, dynamic> body = {
      "username": userName,
      "password": password
    };

    try {
      final response = await client.post(
        Uri.parse("${Api().baseUrl}${Api().authUrl}"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final UserModel user = UserModel.fromJson(result);
        SharedPreferences _pref = await SharedPreferences.getInstance();

        _pref.setString('token', user.token.toString());

        return user;
      } else {
        print("status was failes ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
}
