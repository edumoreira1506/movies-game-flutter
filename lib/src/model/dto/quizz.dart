import 'package:movies_game/src/model/dto/answer.dart';

class QuizzDTO {
  final List<AnswerDTO> answers;
  final int id;
  final String content;

  QuizzDTO(this.content, this.answers, this.id);
}
