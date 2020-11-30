import 'package:emida/widgets/card/ProductCard.dart';
import 'package:flutter/material.dart';

class HomeTabPage extends StatelessWidget {
  GlobalKey<FormState> _homeKey =
      GlobalKey<FormState>(debugLabel: '_homeScreenkey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeKey,
      body: new Stack(children: <Widget>[
        curvefirst(context),
        new Positioned(
          left: 30.0,
          right: 30.0,
          child: greeting(context),
        ),
      ]),
    );
  }

  Widget curvefirst(BuildContext context) {
    return new Container(
      height: 350.0,
      decoration: new BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [new BoxShadow(blurRadius: 10.0)],
        borderRadius: new BorderRadius.vertical(
            bottom: new Radius.elliptical(
                MediaQuery.of(context).size.width, 100.0)),
      ),
    );
  }

  Widget greeting(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "Hello",
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 50.0, color: Colors.white),
        ),
        Text(
          "Juan Añez",
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 22.0, color: Colors.white),
        )
      ],
    );
  }
}
