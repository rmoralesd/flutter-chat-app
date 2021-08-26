import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  //final void Function onPressed();
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    Key key,
    @required this.onPressed,
    @required this.text,
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
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )),
    );
  }
}
