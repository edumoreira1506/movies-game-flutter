import 'package:movies_game/src/model/dto/category.dart';

class CategoryMapper {
  static CategoryDTO toDTO(Map map) {
    return CategoryDTO(map['name'], map['id']);
  }
}
