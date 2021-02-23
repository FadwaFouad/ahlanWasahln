import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/item.dart';

import '../helper/api.dart';

class Products with ChangeNotifier {
  List<Item> _items = [];
  String url = "${Api.BASIC_URL_API}/getProductsTemplets/all/id";

  List<Item> get items => [..._items];

  Future<void> fetchItems() async {
    try {
      if (url == null) return;

      final response = await http.get(url);
      final responseResult =
          json.decode(response.body)['data'] as List<dynamic>;
      List<Item> loadedCategories = [];
      responseResult.forEach((offer) {
        loadedCategories.add(Item(
          id: offer['id'],
          imageUrl: "${Api.BASIC_URL_STORGE}/${offer['image']}",
          name: offer['name'],
          desciption: offer['description'],
        ));
        _items.addAll(loadedCategories);
        notifyListeners();
        url = json.decode(response.body)['next_page_url'] as String;
      });
    } catch (e) {
      throw e;
    }
  }
}
