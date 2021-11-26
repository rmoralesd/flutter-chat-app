// To parse this JSON data, do
//
//     final usuarios = usuariosFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_chat_app/models/usuario.dart';

Usuarios usuariosResponseFromJson(String str) =>
    Usuarios.fromJson(json.decode(str) as Map<String, dynamic>);

String usuariosToJson(Usuarios data) => json.encode(data.toJson());

class Usuarios {
  Usuarios({
    this.ok,
    this.usuarios,
  });

  bool ok;
  List<Usuario> usuarios;

  factory Usuarios.fromJson(Map<String, dynamic> json) => Usuarios(
        ok: json["ok"] as bool,
        usuarios: List<Usuario>.from(json["usuarios"]
                .map((x) => Usuario.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
      };
}
