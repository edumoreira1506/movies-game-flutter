import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_game/src/model/dto/quizz.dart';
import 'package:movies_game/src/presentation/widget/quizz/answer.dart';

class Quizz extends StatelessWidget {
  final QuizzDTO _quizz;
  final void Function(bool, int) _onChange;

  Quizz(this._quizz, this._onChange);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              this._quizz.content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Answer(this._quizz.answers[index], (newValue) => this._onChange(newValue, index)),
                itemCount: this._quizz.answers.length,
              ),
            ),
          ],
        ),
      )
    );
  }
}
