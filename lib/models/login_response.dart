// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_chat_app/models/usuario.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.ok,
    this.usuarioDb,
    this.token,
  });

  bool ok;
  Usuario usuarioDb;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"] as bool,
        usuarioDb: Usuario.fromJson(json["usuarioDB"] as Map<String, dynamic>),
        token: json["token"] as String,
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuarioDB": usuarioDb.toJson(),
        "token": token,
      };
}
