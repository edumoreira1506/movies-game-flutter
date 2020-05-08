import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final String _text;

  Header(this._text);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this._text),
      centerTitle: true,
      backgroundColor: Colors.lightBlue,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
