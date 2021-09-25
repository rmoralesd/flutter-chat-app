import 'package:flutter/material.dart';
import 'package:flutter_chat_app/helpers/mostrar_alerta.dart';
import 'package:flutter_chat_app/services/auth_service.dart';
import 'package:flutter_chat_app/services/socket_service.dart';
import 'package:flutter_chat_app/widgets/custom_button.dart';
import 'package:flutter_chat_app/widgets/custom_input.dart';
import 'package:provider/provider.dart';

import 'labels.dart';
import 'logo.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Logo(),
                  _Form(),
                  Labels(
                    titulo: '¿Ya tienes cuenta?',
                    subTitulo: 'Ingresa con cuenta existente',
                    rutaDestino: 'login',
                  ),
                  Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Nombre',
            //keyBoardType: TextInputType.text,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            keyBoardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          CustomButton(
            onPressed: authService.autenticando
                ? null
                : () async {
                    final registroOk = await authService.register(
                        nameCtrl.text.trim(),
                        emailCtrl.text.trim(),
                        passCtrl.text.trim());

                    if (registroOk == true) {
                      socketService.connect();
                      Navigator.pushReplacementNamed(context, 'usuario');
                    } else {
                      mostrarAlerta(
                          context, 'Registro incorrecto', registroOk as String);
                    }
                  },
            text: 'Crear Cuenta',
          )
        ],
      ),
    );
  }
}
