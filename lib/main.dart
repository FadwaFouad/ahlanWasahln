import 'package:AhlanWaSahln/providers/categories.dart';
import 'package:AhlanWaSahln/providers/pages.dart';
import 'package:AhlanWaSahln/providers/products.dart';
import 'package:AhlanWaSahln/providers/shops.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Screens/bottom_nav_screen.dart';
import 'providers/special_offers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //simple change just for practice .
  //i gotta say , I am immpressed about your code orignization :)
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => SpectialOffers(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Categoties(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Shops(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Pages(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavScreen(),
        //MainScreen(),
      ),
    );
  }
}
