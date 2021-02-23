import 'package:AhlanWaSahln/providers/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'future_widget.dart';

final heightRatio = 0.35;
final widthRatio = 0.35;

class CategoriesLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureWidget(
      future: Provider.of<Categoties>(context, listen: false).fetchItems(),
      height: size.height * heightRatio,
      widget: CategoriesList(),
    );
  }
}

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Categoties>(context, listen: false).items;
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * heightRatio,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
//      physics: ,
        itemBuilder: (ctx, index) => CategoryItem(
          list[index].name,
          list[index].desciption,
          list[index].imageUrl,
        ),
        itemCount: list.length,
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  String name;
  String desciption;
  String imageUrl;
  CategoryItem(this.name, this.desciption, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * widthRatio,
      height: size.height * heightRatio,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(255, 182, 193, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Divider(),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            desciption,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
