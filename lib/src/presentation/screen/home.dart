
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_game/src/model/dto/category.dart';
import 'package:movies_game/src/model/service/category_service.dart';
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

  void _selectCategory(CategoryDTO category) {

  }

  void _selectAll() {

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
          Categories(this._categories, this._selectCategory, this._selectAll, this._showRanking)
        ]
      )
    );
  }
}
