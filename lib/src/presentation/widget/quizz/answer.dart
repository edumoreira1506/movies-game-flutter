import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_game/src/model/dto/answer.dart';

class Answer extends StatelessWidget{
  final AnswerDTO _answer;
  final void Function(bool) _onChanged;

  Answer(this._answer, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(this._answer.content),
      value: this._answer.checked,
      secondary: CircleAvatar(
        child: Icon(
          this._answer.checked ? Icons.check : Icons.error
        )
      ),
      onChanged: (newValue) => this._onChanged(newValue),
    );
  }
}
