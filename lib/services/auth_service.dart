import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/global/environment.dart';
import 'package:flutter_chat_app/models/login_response.dart';
import 'package:flutter_chat_app/models/usuario.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  Usuario usuario;

  Future login(String email, String password) async {
    final data = {'email': email, 'password': password};
    final resp = await http.post(
      '${Environment.apiURL}/login',
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    print(resp.body);
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuarioDb;
    }
  }
}
