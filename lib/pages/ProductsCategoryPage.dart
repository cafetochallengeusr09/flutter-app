import 'dart:ui';

import 'package:clippy_flutter/rhombus.dart';
import 'package:emida/commons/ui/HelperAppBar.dart';
import 'package:emida/controller/ProductsCategoryController.dart';
import 'package:emida/models/Product.dart';
import 'package:emida/widgets/card/ProductCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ProductsCategoryPage extends StatefulWidget {
  ProductsCategoryPage({Key key}) : super(key: key);

  @override
  _ProductsCategoryPageState createState() => _ProductsCategoryPageState();
}

class _ProductsCategoryPageState extends StateMVC<ProductsCategoryPage> {
  ProductsCategoryController _controller;
  Future<Stream<Product>> products;

  _ProductsCategoryPageState() : super(ProductsCategoryController()) {
    _controller = controller;
  }

  @override
  void initState() {
    products = _controller.listenAll();
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
    return Scaffold(
      appBar: HelperAppBar.onlyAppBar(context, _controller.scaffoldKey),
      body: Stack(
        children: [
          curveFirst(context),
          new Positioned(
            left: 30.0,
            right: 30.0,
            child: Text(
              "Productos",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontSize: 37,
              ),
            ),
          ),
          categoriesCards(context),
        ],
      ),
    );
  }

  Widget categoriesCards(BuildContext context) {
    return FutureBuilder(
      future: products,
      builder: (BuildContext context, AsyncSnapshot<Stream<Product>> snapshot) {
        if (snapshot.hasData) {
          return fillContent(context);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget fillContent(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(5, 75, 5, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 50.0,
        child: GridView.count(
          crossAxisCount: 2,
          primary: false,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.7,
          children: _controller.products
              .map((model) => ProductCard.buildProductCard(
                  model, (model.id % 2.0 == 0 ? true : false), context))
              .toList(),
        ));
  }

  Widget curveFirst(BuildContext context) {
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
