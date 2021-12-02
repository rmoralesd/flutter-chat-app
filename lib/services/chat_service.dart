import 'package:flutter/material.dart';
import 'package:flutter_chat_app/global/environment.dart';
import 'package:flutter_chat_app/models/mensajes_response.dart';
import 'package:flutter_chat_app/models/usuario.dart';
import 'package:flutter_chat_app/services/auth_service.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final resp = await http.get('${Environment.apiURL}/mensajes/$usuarioID',
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        });
    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }
}
