import 'dart:convert';

import 'package:movies_game/src/model/dto/answer.dart';
import 'package:movies_game/src/model/dto/category.dart';
import 'package:http/http.dart' as http;
import 'package:movies_game/src/model/dto/quizz.dart';
import 'package:movies_game/src/model/mapper/answer.dart';
import 'package:movies_game/src/model/mapper/category.dart';
import 'package:movies_game/src/model/mapper/quizz.dart';

class CategoryService {
  final String _apiUrl = 'https://movies-game-api-edumoreira1506.herokuapp.com/api';

  static final CategoryService _instance = CategoryService.internal();

  factory CategoryService() => _instance;

  CategoryService.internal();

  Future<List<CategoryDTO>> all() async {
    http.Response response = await http.get("$_apiUrl/category");

    Map<String, dynamic> parsedResponse = json.decode(response.body);
    List<dynamic> mapCategories = parsedResponse['categories'] ?? [];
    List<CategoryDTO> categoriesDtos = mapCategories.map((mappedCategory) => CategoryMapper.toDTO(mappedCategory)).toList();

    return categoriesDtos;
  }

  Future<List<QuizzDTO>> getQuizz(int id) async {
    http.Response response = await http.get("$_apiUrl/category/$id/movie");

    Map<String, dynamic> parsedResponse = json.decode(response.body);
    List<dynamic> mapQuizzes = parsedResponse['quizzes'] ?? [];
    List<QuizzDTO> quizzes = mapQuizzes.map((quizzMap) {
      List<dynamic> answersMap = quizzMap['answers'];
      List<AnswerDTO> answers = answersMap.map((answerMap) => AnswerMapper.toDTO(answerMap)).toList();

      return QuizzMapper.toDTO(quizzMap, answers);
    }).toList();

    return quizzes;
  }
}
