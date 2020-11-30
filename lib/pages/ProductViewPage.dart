import 'dart:ui';

import 'package:clippy_flutter/rhombus.dart';
import 'package:emida/commons/model/RouteArgument.dart';
import 'package:emida/controller/ProductViewController.dart';
import 'package:emida/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ProductViewPage extends StatefulWidget {
  final RouteArgument routeArgument;

  ProductViewPage({Key key, this.routeArgument}) : super(key: key);

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends StateMVC<ProductViewPage> {
  ProductViewController _controller;

  _ProductViewPageState() : super(ProductViewController()) {
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  Widget buildArc(BuildContext context) {
    return Rhombus(
      child: Container(
        color: Colors.orangeAccent,
        width: 100.0,
        height: 100.0,
        child: Center(child: Text('Rhombus')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Product model = widget.routeArgument.param;

    return Scaffold(
        //appBar: HelperAppBar.onlyAppBar(context, _controller.scaffoldKey),
        body: CustomScrollView(
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
          SliverAppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,

            floating: true,
            pinned: true,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(''),
                background: Image.network(
                  model.image_url,
                  fit: BoxFit.fitWidth,
                )),
            // Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 350,
          ),
          SliverFillRemaining(
            child: buildDetail(context, model),
          )
        ]));
  }

  Widget buildDetail(BuildContext context, Product product) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: product.name,
            child: Image.asset(
              product.image_url,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                product.unit,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "\$ ",
                    style: TextStyle(color: Colors.pink, fontSize: 20),
                  ),
                  TextSpan(
                    text: "${product.price}",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                product.name.replaceAll("\n", " ") + "\t\t\t\t",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 32.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            product.description,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Icon(Icons.share, color: Colors.pink, size: 42.0),
                ),
                Icon(Icons.favorite_border, color: Colors.pink, size: 42.0)
              ],
            ),
          ),
          Divider(
            color: Color(0xFFECECEC),
            thickness: 1,
            height: 52,
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[Color(0xFF37ecba), Color(0xFF72afd3)],
                          tileMode: TileMode.clamp,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 1.0]),
                      borderRadius: BorderRadius.all(Radius.circular(80.0))),
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child:
                      const Text('¡Comprar!', style: TextStyle(fontSize: 20)),
                ),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[Color(0xFF37ecba), Color(0xFF72afd3)],
                          tileMode: TileMode.clamp,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 1.0]),
                      borderRadius: BorderRadius.all(Radius.circular(80.0))),
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  var bgGradient = new LinearGradient(
    colors: [const Color(0xFF9BFBC1), const Color(0xFFF3F9A7)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 1.0],
  );

  var btnGradient = new LinearGradient(
    colors: [const Color(0xFF37ecba), const Color(0xFF72afd3)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 1.0],
  );
}
