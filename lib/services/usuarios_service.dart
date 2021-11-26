import 'package:flutter_chat_app/global/environment.dart';
import 'package:flutter_chat_app/models/usuarios_response.dart';
import 'package:flutter_chat_app/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_chat_app/models/usuario.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environment.apiURL}/usuarios', headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
