import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_game/src/model/dto/answer.dart';
import 'package:movies_game/src/model/dto/category.dart';
import 'package:movies_game/src/model/dto/quizz.dart';
import 'package:movies_game/src/presentation/widget/header.dart';
import 'package:movies_game/src/presentation/widget/quizz/quizz.dart';

class QuizzPage extends StatefulWidget {
  final List<QuizzDTO> quizzes;
  final CategoryDTO category;

  QuizzPage(this.quizzes, this.category);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  CategoryDTO _category;
  List<QuizzDTO> _quizzes;

  @override
  void initState() {
    super.initState();

    setState(() {
      _quizzes = widget.quizzes;
      _category = widget.category;
    });
  }

  void _handleChangeAnswwer(int indexQuizz, int indexAnswer, bool checked) {
    QuizzDTO currentQuizz = _quizzes[indexQuizz];
    List<AnswerDTO> answers = currentQuizz.answers;
    List<AnswerDTO> newAnswers = answers.asMap().entries.map((entry) {
      int index = entry.key;
      AnswerDTO item = entry.value;

      if (index == indexAnswer) item.checked = true;
      else item.checked = false;

      return item;
    }).toList();

    setState(() {
      _quizzes[indexQuizz].answers = newAnswers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(_category.name),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) => ConstrainedBox(
          child: Quizz(this._quizzes[index], (checked, indexAnswer) => this._handleChangeAnswwer(index, indexAnswer, checked)),
          constraints: BoxConstraints(minHeight: 10, maxHeight: 400),
        ),
        itemCount: this._quizzes.length,
      )
    );
  }
}
