import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_game/src/model/dto/category.dart';
import 'package:movies_game/src/model/dto/quizz.dart';
import 'package:movies_game/src/presentation/widget/header.dart';

class QuizzPage extends StatelessWidget {
  final List<QuizzDTO> _quizzes;
  final CategoryDTO _category;

  QuizzPage(this._quizzes, this._category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(this._category.name),
      body: Center(
        child: Text('Agora sim!')
      ),
    );
  }
}
