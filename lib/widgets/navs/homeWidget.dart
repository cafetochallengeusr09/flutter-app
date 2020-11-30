import 'package:emida/widgets/home/graph.dart';
import 'package:flutter/material.dart';

class homeWidget extends StatelessWidget {
  GlobalKey<FormState> _homeKey = GlobalKey<FormState>(debugLabel: '_homeScreenkey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeKey,
      body: new Stack(children: <Widget>[
        curvefirst(context),
        LineChartGraph(),
        new Positioned(
          left: 30.0,
          right: 30.0,
          child: greeting(context),
        ),
        new Positioned(
          top: 120.0,
          left: 30.0,
          right: 30.0,
          child: balanceCard(context),
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

  Widget balanceCard(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          elevation: 1.0,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    '\$120.00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 57.0,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    'Current Balance.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
