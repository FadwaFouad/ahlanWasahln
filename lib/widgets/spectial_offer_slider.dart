import 'package:AhlanWaSahln/providers/special_offers.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import 'future_widget.dart';

class SpectialOfferSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureWidget(
      future: Provider.of<SpectialOffers>(context, listen: false)
          .fetchItemsImages(),
      height: 200.0,
      widget: SpectialOfferImages(),
    );
  }
}

class SpectialOfferImages extends StatefulWidget {
  @override
  _SpectialOfferImagesState createState() => _SpectialOfferImagesState();
}

class _SpectialOfferImagesState extends State<SpectialOfferImages> {
  int _current = 0;

//dots of images
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (int i = 0; i < list.length; i++) result.add(handler(i));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final imagesList =
        Provider.of<SpectialOffers>(context, listen: false).getItemsImages();
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            initialPage: 0,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            onPageChanged: (index, _) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: imagesList
              .map((url) => SpectialOfferItem(
                    url: url,
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(imagesList, (index) {
            return Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Theme.of(context).accentColor
                      : Colors.grey),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            );
          }),
        ),
      ],
    );
  }
}

class SpectialOfferItem extends StatelessWidget {
  final String url;

  const SpectialOfferItem({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Image.network(
          url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
