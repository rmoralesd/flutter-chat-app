import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String rutaDestino;
  final String subTitulo;
  final String titulo;

  const Labels({
    Key key,
    @required this.rutaDestino,
    @required this.subTitulo,
    @required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, rutaDestino);
          },
          child: Text(
            subTitulo,
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
