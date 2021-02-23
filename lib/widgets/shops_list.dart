import 'package:AhlanWaSahln/providers/shops.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'future_widget.dart';

final heightRatio = 0.30;
final widthRatio = 0.30;

class ShopListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureWidget(
      future: Provider.of<Shops>(context, listen: false).fetchItems(),
      height: MediaQuery.of(context).size.height * heightRatio,
      widget: ShopList(),
    );
  }
}

class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Shops>(context, listen: false).items;
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * heightRatio,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
//      physics: ,
        itemBuilder: (ctx, index) => ShopItem(
          list[index].name,
          list[index].desciption,
          list[index].imageUrl,
        ),
        itemCount: list.length,
      ),
    );
  }
}

class ShopItem extends StatelessWidget {
  String name;
  String desciption;
  String imageUrl;
  ShopItem(this.name, this.desciption, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * widthRatio,
      height: size.height * heightRatio,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.50, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        //color: Color.fromRGBO(255, 182, 193, 1),
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
          FittedBox(
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FittedBox(
            child: Row(
              children: [
                Text(
                  desciption,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
