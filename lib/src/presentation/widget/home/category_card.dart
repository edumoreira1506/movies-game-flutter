import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_game/src/presentation/widget/home/square_button.dart';

class CategoryCard extends StatelessWidget {
  final String _name;
  final void Function() _onClick;

  CategoryCard(this._name, this._onClick);

  @override
  Widget build(BuildContext context) {
    return SquareButton(this._name, this._onClick);
  }
}
