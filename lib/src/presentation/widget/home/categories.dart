import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_game/src/model/dto/category.dart';
import 'package:movies_game/src/presentation/widget/home/category_card.dart';
import 'package:movies_game/src/presentation/widget/home/square_button.dart';

class Categories extends StatelessWidget {
  final List<CategoryDTO> _categories;
  final void Function(CategoryDTO) _onToggleCategory;
  final void Function() _onOpenRanking;
  final void Function() _onSelectAll;

  Categories(this._categories, this._onToggleCategory, this._onOpenRanking, this._onSelectAll);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        itemCount: this._categories.length + 2,
        itemBuilder: (context, index) =>
          index < this._categories.length
           ? CategoryCard(this._categories[index].name, () => this._onToggleCategory(this._categories[index]))
           : index % 2 == 0 ? SquareButton('All', this._onSelectAll) : SquareButton('Ranking', this._onOpenRanking)
      )
    );
  }
}
