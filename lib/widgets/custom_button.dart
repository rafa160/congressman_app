import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const CustomButton({Key key, this.text, this.onPressed, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: RaisedButton(
        color: color,
        onPressed: onPressed,
        child: Text(text, style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w700
        ),),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
