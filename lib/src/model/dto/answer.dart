class AnswerDTO {
  final String content;
  final bool correct;
  final int id;

  bool checked = false;

  AnswerDTO(this.content, this.correct, this.id);
}
