// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) =>
    Usuario.fromJson(json.decode(str) as Map<String, dynamic>);

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.online,
    this.nombre,
    this.email,
    this.uid,
  });

  bool online;
  String nombre;
  String email;
  String uid;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        online: json["online"] as bool,
        nombre: json["nombre"] as String,
        email: json["email"] as String,
        uid: json["uid"] as String,
      );

  Map<String, dynamic> toJson() => {
        "online": online,
        "nombre": nombre,
        "email": email,
        "uid": uid,
      };
}
