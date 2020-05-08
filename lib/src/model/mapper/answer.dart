import 'package:movies_game/src/model/dto/answer.dart';

class AnswerMapper {
  static AnswerDTO toDTO(Map map) {
    return AnswerDTO(map['answer'], map['correct'], map['id']);
  }
}
