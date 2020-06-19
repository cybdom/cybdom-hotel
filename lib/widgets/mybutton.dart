import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key key, @required this.onTap, @required this.text})
      : super(key: key);
  final onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.greenAccent],
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Text(
          "$text",
          style:
              Theme.of(context).textTheme.button.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
