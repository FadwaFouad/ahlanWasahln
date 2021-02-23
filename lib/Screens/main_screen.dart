import 'package:AhlanWaSahln/widgets/categories_list.dart';
import 'package:AhlanWaSahln/widgets/products_list.dart';
import 'package:AhlanWaSahln/widgets/shops_list.dart';
import 'package:AhlanWaSahln/widgets/topic_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/spectial_offer_slider.dart';

enum Pages {
  MainMenu,
  CategoriesPage,
  ShopsPage,
  ProductsPage,
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: ListView(
        children: [
          SpectialOfferSlider(),
          Divider(),
          TopicBar(
            barName: "Categories",
            pageIndex: Pages.CategoriesPage.index,
          ),
          CategoriesLoader(),
          Divider(),
          TopicBar(
            barName: "Shops",
            pageIndex: Pages.ShopsPage.index,
          ),
          ShopListLoader(),
          Divider(),
          TopicBar(
            barName: "Products",
            pageIndex: Pages.ProductsPage.index,
          ),
          ProductsListLoader(),
        ],
      ),
    );
  }
}
