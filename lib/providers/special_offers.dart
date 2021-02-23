import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/special_offer.dart';
import '../helper/api.dart';

class SpectialOffers with ChangeNotifier {
  List<SpecialOffer> items = [];

  Future<void> fetchItemsImages() async {
    String url = "${Api.BASIC_URL_API}/getSpecialOffersUserId&347";
    try {
      final response = await http.get(url);
      final responseResult = json.decode(response.body) as List<dynamic>;
      List<SpecialOffer> loadedOffer = [];
      responseResult.forEach((offer) {
        loadedOffer.add(SpecialOffer(
          imageUrl: "${Api.BASIC_URL_STORGE}/${offer['image']}",
        ));
        items = loadedOffer;
        notifyListeners();
      });
    } catch (e) {
      throw e;
    }
  }

  List<String> getItemsImages() {
    List<String> imageUrls = [];
    items.forEach((offer) {
      imageUrls.add(offer.imageUrl);
    });
    return imageUrls;
  }
}
