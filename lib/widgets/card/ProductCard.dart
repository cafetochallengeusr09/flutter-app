import 'package:emida/commons/model/RouteArgument.dart';
import 'package:emida/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard {
  static Widget buildProductCard(Product model, bool isAdded, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/ProductView',
                  arguments: RouteArgument(param: model));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  transform:
                                      Matrix4.translationValues(0.0, 0.0, 0.0),
                                  child: Text("\$" + model.price.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ),
                              ])),
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                false //TODO
                                    ? Icon(Icons.favorite, color: Colors.pink)
                                    : Icon(Icons.favorite_border,
                                        color: Colors.pink)
                              ])),
                    ],
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                    child: Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.network(
                          model.image_url,
                          height: 155,
                        ),
                        Container(
                          transform:
                              Matrix4.translationValues(-70.0, -68.0, 0.0),
                          child: Text("x " + model.unit,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.3))),
                        ),
                        Container(
                          transform: Matrix4.translationValues(70.0, 68.0, 0.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.7, horizontal: 7),
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(17)) // green shaped
                              ),
                          child: Text(
                              model.discount_price.round().toString() + "%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Text(model.name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Colors.pink, height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!isAdded) ...[
                              Icon(Icons.shopping_cart,
                                  color: Colors.pink, size: 24.0),
                              Text('Agregar',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Colors.pink,
                                      fontSize: 15.0))
                            ],
                            if (isAdded) ...[
                              Icon(Icons.remove_circle_outline,
                                  color: Colors.pink, size: 24.0),
                              Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0)),
                              Icon(Icons.add_circle_outline,
                                  color: Colors.pink, size: 24.0),
                            ]
                          ]))
                ]))));
  }
}
