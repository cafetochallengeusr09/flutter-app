import 'package:emida/widgets/navs/favorite/PlanetRow.dart';
import 'package:flutter/material.dart';

class favoriteWidget extends StatelessWidget {
  GlobalKey<FormState> _favoriteKey =
      GlobalKey<FormState>(debugLabel: '_favoriteScreenkey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _favoriteKey,
        body: Stack(
          children: [
            curvefirst(context),
            new Positioned(
              left: 30.0,
              right: 30.0,
              child: Text(
                "Favorites",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                ),
              ),
            ),
            buildListView(context),
          ],
        ));
  }

  Widget buildListView(BuildContext context) {
    return new ListView.builder(
      padding: EdgeInsets.fromLTRB(30, 75, 30, 0),
      itemBuilder: (context, index) => new PlanetRow(),
      itemCount: 12,
    );
  }

  Widget buildPlants(BuildContext context, int index) {
    return Row(
      children: [
        Expanded(
          child: Card(
            //margin: EdgeInsets.fromLTRB(50, 15, 0, 0),
            elevation: 20.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Center(
                child: Text(
                  'PRO $index',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            //margin: EdgeInsets.fromLTRB(50, 15, 0, 0),
            elevation: 20.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Center(
                child: Text(
                  'PRO $index',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
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
}
