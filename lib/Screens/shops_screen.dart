import 'package:AhlanWaSahln/providers/shops.dart';
import 'package:AhlanWaSahln/widgets/future_widget.dart';
import 'package:AhlanWaSahln/widgets/shops_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopsScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureWidget(
      future: Provider.of<Shops>(context, listen: false).fetchItems(),
      height: size.height,
      widget: ShopsGrid(),
    );
  }
}

class ShopsGrid extends StatefulWidget {
  @override
  _ShopsGridState createState() => _ShopsGridState();
}

class _ShopsGridState extends State<ShopsGrid> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      final shopProvider = Provider.of<Shops>(context, listen: false);
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) shopProvider.fetchItems();
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Shops>(context).items;

    return GridView.builder(
//      physics: ,
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
      ),
      itemBuilder: (ctx, index) => ShopItem(
        list[index].name,
        list[index].desciption,
        list[index].imageUrl,
      ),
      itemCount: list.length,
    );
  }
}
