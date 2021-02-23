import 'package:AhlanWaSahln/providers/categories.dart';
import 'package:AhlanWaSahln/widgets/categories_list.dart';
import 'package:AhlanWaSahln/widgets/future_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureWidget(
      future: Provider.of<Categoties>(context, listen: false).fetchItems(),
      height: size.height,
      widget: CategoriesGrid(),
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Categoties>(context, listen: false).items;

    return GridView.builder(
//      physics: ,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
      ),
      itemBuilder: (ctx, index) => CategoryItem(
        list[index].name,
        list[index].desciption,
        list[index].imageUrl,
      ),
      itemCount: list.length,
    );
  }
}
