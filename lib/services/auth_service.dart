import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/global/environment.dart';
import 'package:flutter_chat_app/models/login_response.dart';
import 'package:flutter_chat_app/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  Usuario usuario;
  bool _autenticando = false;

  final _storage = new FlutterSecureStorage();

  bool get autenticando => _autenticando;
  set autenticando(bool value) {
    _autenticando = value;
    notifyListeners();
  }

  static Future<String> getToken() async {
    const _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    const _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    autenticando = true;

    final data = {'email': email, 'password': password};
    final resp = await http.post(
      '${Environment.apiURL}/login',
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    print(resp.body);
    autenticando = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuarioDb;
      await _guardarToken(loginResponse.token);
      return true;
    }
    return false;
  }

  Future _guardarToken(String token) async {
    return _storage.write(key: 'token', value: token);
  }

  Future _logOut() async {
    return _storage.delete(key: 'token');
  }
}
