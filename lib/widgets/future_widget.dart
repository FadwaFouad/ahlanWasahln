import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureWidget extends StatelessWidget {
  final future;
  final height;
  final widget;

  const FutureWidget({Key key, this.future, this.height, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Container(
                  height: height,
                  child: Center(child: CircularProgressIndicator()))
              : widget,
    );
  }
}
