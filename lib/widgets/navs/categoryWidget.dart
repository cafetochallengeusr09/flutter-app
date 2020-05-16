import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class categoryWidget extends StatelessWidget {
  GlobalKey<FormState> _categoryKey =
      GlobalKey<FormState>(debugLabel: '_categoryScreenkey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _categoryKey,
        body: Stack(
          children: [
            curvefirst(context),
            new Positioned(
              left: 30.0,
              right: 30.0,
              child: Text(
                "Categories",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                ),
              ),
            ),
            categoriesCards(context),
          ],
        )
    );
  }

  Widget categoriesCards(BuildContext context) {
    return GridView.count(
      key: UniqueKey(),
      padding: EdgeInsets.fromLTRB(0, 75, 0, 0),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: List.generate(25, (index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            elevation: 20.0,
            child: Center(
              child: Text(
                'CAT_ $index',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
      }),
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
