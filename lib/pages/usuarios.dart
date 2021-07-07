import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(uid: '1', nombre: 'Ricardo', email: 'test@test.com', online: true),
    Usuario(uid: '2', nombre: 'Morales', email: 'test@test.com', online: true),
    Usuario(
        uid: '2', nombre: 'Dominguez', email: 'test@test.com', online: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mi nombre',
            style: TextStyle(color: Colors.black87),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.check_circle,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (_, i) => ListTile(
            title: Text(usuarios[i].nombre),
            leading: CircleAvatar(
              child: Text(usuarios[i].nombre.substring(0, 2)),
            ),
            trailing: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: usuarios[i].online ? Colors.green[300] : Colors.red,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          separatorBuilder: (_, i) => Divider(),
          itemCount: usuarios.length,
        ));
  }
}
