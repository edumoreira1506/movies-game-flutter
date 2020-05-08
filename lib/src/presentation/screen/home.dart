
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_game/src/model/dto/category.dart';
import 'package:movies_game/src/model/dto/quizz.dart';
import 'package:movies_game/src/model/service/category_service.dart';
import 'package:movies_game/src/presentation/screen/quizz.dart';
import 'package:movies_game/src/presentation/widget/header.dart';
import 'package:movies_game/src/presentation/widget/home/categories.dart';
import 'package:movies_game/src/presentation/widget/spinner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryDTO> _categories = List();
  CategoryService _service = CategoryService();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _fetchCategories();
  }

  void _fetchCategories() async {
    List<CategoryDTO> categories = await _service.all();

    setState(() {
      _categories = categories;
      _isLoading = false;
    });
  }

  void _selectCategory(CategoryDTO category) async {
    List<QuizzDTO> quizzes = await _service.getQuizz(category.id);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizzPage(quizzes, category))
    );
  }

  void _selectAll() async {
    List<QuizzDTO> quizzes = await _service.getAll();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizzPage(quizzes, CategoryDTO('Todas', 0)))
    );
  }

  void _showRanking() {

  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Spinner() : Scaffold(
      appBar: Header('Movies Game'),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Categories(this._categories, this._selectCategory, this._showRanking, this._selectAll)
        ]
      )
    );
  }
}
