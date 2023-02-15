import 'package:hive_flutter/hive_flutter.dart';

import 'package:pc_builder_mk_mobile/domain/responses/login_response.dart';

class AuthService {
  static final AuthService _instance = AuthService._privateConstructor();

  AuthService._privateConstructor();

  static AuthService get instance => _instance;

  LoginResponse login(String username, String password) {
    // TODO: make call to api and try to login
    return const LoginResponse(success: true, message: "Success!");
  }

  void logout() {
    final box = Hive.box('localstorage');
    box.delete('token');
  }

  bool userIsLoggedIn() {
    final box = Hive.box('localstorage');

    return box.get('token') != null;
  }
}
