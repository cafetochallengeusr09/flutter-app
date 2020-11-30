import 'package:emida/models/Product.dart';
import 'package:emida/services/ProductsCategoryService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ProductsCategoryController extends ControllerMVC {
  List<Product> products = <Product>[];
  GlobalKey<ScaffoldState> scaffoldKey;
  Product product;

  ProductsCategoryController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  Future<Stream<Product>> listenAll() async {
    final Stream<Product> stream = await ProductsCategoryService.findAll();
    products = <Product>[];
    stream.listen((Product model) {
      setState(() {
        products.add(model);
      });
    }, onError: (a) {
      print(a);
      //ERR
    }, onDone: () {
      //OK
    });
    return stream;
  }
}
