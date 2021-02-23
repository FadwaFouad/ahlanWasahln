import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/item.dart';

import '../helper/api.dart';

class Categoties with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => [..._items];

  Future<void> fetchItems() async {
    String url = "${Api.BASIC_URL_API}/getCategories";
    try {
      final response = await http.get(url);
      final responseResult = json.decode(response.body) as List<dynamic>;
      List<Item> loadedCategories = [];
      responseResult.forEach((offer) {
        loadedCategories.add(Item(
          id: offer['id'],
          imageUrl: "${Api.BASIC_URL_STORGE}/${offer['image']}",
          name: offer['name'],
          desciption: offer['description'],
        ));
        _items = loadedCategories;
        notifyListeners();
      });
    } catch (e) {
      throw e;
    }
  }
}
