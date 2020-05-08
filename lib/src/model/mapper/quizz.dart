import 'package:movies_game/src/model/dto/answer.dart';
import 'package:movies_game/src/model/dto/quizz.dart';

class QuizzMapper {
  static QuizzDTO toDTO(Map map, List<AnswerDTO> answers) {
    return QuizzDTO(map['sentence'], answers, map['id']);
  }
}
