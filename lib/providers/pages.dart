import 'package:AhlanWaSahln/Screens/Categories_screen.dart';
import 'package:AhlanWaSahln/Screens/main_screen.dart';
import 'package:AhlanWaSahln/Screens/shops_screen.dart';
import 'package:AhlanWaSahln/widgets/products_list.dart';
import 'package:flutter/material.dart';

class Pages with ChangeNotifier {
  int _pageIndex = 0;
  PageController _controller = PageController();

  List _pagesWidget = [
    MainScreen(),
    CategoriesScreenLoader(),
    ShopsScreenLoader(),
    ProductsListLoader(),
  ];

  List<dynamic> _pages = [
    {
      'page': MainScreen(),
      'title': 'Main Menu',
      'icon': Icons.home,
    },
    {
      'page': CategoriesScreenLoader(),
      'title': 'Categories',
      'icon': Icons.category,
    },
    {
      'page': ShopsScreenLoader(),
      'title': 'Shops',
      'icon': Icons.shopping_cart_sharp,
    },
    {
      'page': ProductsListLoader(),
      'title': 'Products',
      'icon': Icons.shopping_bag,
    },
  ];

  List<dynamic> get pages => [..._pages];
  List<Widget> get pagesWidget => [..._pagesWidget];
  int get currentPageIndex => _pageIndex;
  PageController get pageController => _controller;

  void changePage(int newPageIndex) {
    _pageIndex = newPageIndex;
    notifyListeners();
  }

  void jumpToPage(int newPageIndex) {
    _controller.jumpToPage(newPageIndex);
    notifyListeners();
  }
}
