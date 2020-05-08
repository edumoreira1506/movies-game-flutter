import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SquareButton extends StatelessWidget {
  final String _text;
  final void Function() _onClick;

  SquareButton(this._text, this._onClick);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.lightBlue,
      child: Text(
        this._text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w200
        ),
      ),
      onPressed: this._onClick
    );
  }
}
