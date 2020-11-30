import 'package:emida/models/category.dart';
import 'package:emida/services/CategoryService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CategoryController extends ControllerMVC {
  List<Category> categories = <Category>[];
  GlobalKey<ScaffoldState> scaffoldKey;
  Category category;

  CategoryController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  Future<Stream<Category>> listenAllCategories() async {
    final Stream<Category> stream = await CategoryService.findAll();
    categories = <Category>[];
    stream.listen((Category model) {
      setState(() {
        categories.add(model);
      });
    }, onError: (a) {
      //ERR
    }, onDone: () {
      //OK
    });
    return stream;
  }
}
