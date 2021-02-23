import 'package:AhlanWaSahln/providers/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicBar extends StatelessWidget {
  final barName;
  final int pageIndex;

  const TopicBar({Key key, this.barName, this.pageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            child: Text("< Show all"),
            onPressed: () {
              Provider.of<Pages>(context, listen: false).jumpToPage(pageIndex);
            },
          ),
          Text(barName),
        ],
      ),
    );
  }
}
