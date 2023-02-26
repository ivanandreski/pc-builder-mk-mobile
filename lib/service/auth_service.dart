import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:pc_builder_mk_mobile/domain/responses/login_response.dart';
import 'package:pc_builder_mk_mobile/utils/constants.dart';

class AuthService {
  static final AuthService _instance = AuthService._privateConstructor();

  AuthService._privateConstructor();

  static AuthService get instance => _instance;

  Future<LoginResponse> register(String email, String password) async {
    final data = {'email': email, 'password': password};
    final url = Uri.parse('${Constants.apiUrl}/auth/register');
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: json.encode(data));
    if (response.statusCode == 200) {
      final token = json.decode(response.body)['token'];
      final box = Hive.box('localstorage');
      await box.put('token', token);

      return const LoginResponse(success: true, message: "Sucess!");
    } else {
      return const LoginResponse(
          success: false, message: "Something went wrong!");
    }
  }

  Future<LoginResponse> login(String email, String password) async {
    final data = {'email': email, 'password': password};
    final url = Uri.parse('${Constants.apiUrl}/auth/login');
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: json.encode(data));
    if (response.statusCode == 200) {
      final token = json.decode(response.body)['token'];
      final box = Hive.box('localstorage');
      await box.put('token', token);

      return const LoginResponse(success: true, message: "Sucess!");
    } else {
      return const LoginResponse(
          success: false, message: "Something went wrong!");
    }
  }

  Future<void> logout() async {
    final box = Hive.box('localstorage');
    await box.delete('token');
  }

  bool userIsLoggedIn() {
    final box = Hive.box('localstorage');

    return box.get('token') != null;
  }
}
