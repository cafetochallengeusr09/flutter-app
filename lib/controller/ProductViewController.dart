import 'package:emida/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ProductViewController extends ControllerMVC {
  List<Product> products = <Product>[];
  GlobalKey<ScaffoldState> scaffoldKey;
  Product product;

  ProductViewController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
}
