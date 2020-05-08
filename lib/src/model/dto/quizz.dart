import 'package:movies_game/src/model/dto/answer.dart';

class QuizzDTO {
  final int id;
  final String content;
  
  List<AnswerDTO> answers;

  QuizzDTO(this.content, this.answers, this.id);
}
