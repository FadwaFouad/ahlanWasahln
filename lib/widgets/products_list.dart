import 'package:AhlanWaSahln/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'future_widget.dart';

final heightRatio = 0.30;
final widthRatio = 0.20;

class ProductsListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureWidget(
      future: Provider.of<Products>(context, listen: false).fetchItems(),
      height: MediaQuery.of(context).size.height * heightRatio,
      widget: ProductsList(),
    );
  }
}

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent)
        Provider.of<Products>(context, listen: false).fetchItems();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Products>(context).items;
    // final size = MediaQuery.of(context).size;

    return GridView.builder(
      shrinkWrap: true,
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (ctx, index) => ProductsItem(
        list[index].name,
        list[index].imageUrl,
      ),
      itemCount: list.length,
    );
  }
}

class ProductsItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  ProductsItem(this.name, this.imageUrl);

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
        color: Colors.grey.shade300,
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
        ],
      ),
    );
  }
}
