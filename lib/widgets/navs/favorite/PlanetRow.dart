import 'package:flutter/material.dart';

class PlanetRow extends StatelessWidget {
  PlanetRow();

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      //margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        image: new AssetImage("assets/images/att.png"),
        height: 92.0,
        width: 92.0,
      ),
    );

    final baseTextStyle = const TextStyle(fontFamily: 'Ubuntu');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 20.0,
        fontWeight: FontWeight.w400);

    Widget _planetValue({String value, String image}) {
      return new Row(children: <Widget>[
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text("9.52", style: regularTextStyle),
      ]);
    }

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: new Text("\$30.45",
                style: TextStyle(fontSize: 58, color: Colors.white)),
          ),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      margin: new EdgeInsets.only(left: 45.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ));
  }
}
