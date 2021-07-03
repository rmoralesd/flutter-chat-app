import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  //final void Function onPressed();
  final VoidCallback onPressed;

  const CustomButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 2,
        primary: Colors.blue,
        shape: const StadiumBorder(),
      ),
      child: Container(
          width: double.infinity,
          height: 55,
          child: const Center(
            child: Text(
              'Ingrese',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )),
    );
  }
}
