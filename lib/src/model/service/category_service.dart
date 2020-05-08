import 'dart:convert';

import 'package:movies_game/src/model/dto/category.dart';
import 'package:http/http.dart' as http;
import 'package:movies_game/src/model/mapper/category.dart';

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
}
