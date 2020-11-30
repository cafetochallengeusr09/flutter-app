import 'package:emida/controller/CategoryController.dart';
import 'package:emida/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CategoryTabPage extends StatefulWidget {
  CategoryTabPage({Key key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends StateMVC<CategoryTabPage> {
  CategoryController _controller;
  Future<Stream<Category>> categories;

  _CategoryWidgetState() : super(CategoryController()) {
    _controller = controller;
  }

  @override
  void initState() {
    categories = _controller.listenAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _controller.scaffoldKey,
        body: Stack(
          children: [
            curveFirst(context),
            new Positioned(
              left: 30.0,
              right: 30.0,
              child: Text(
                "Categories",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 37,
                ),
              ),
            ),
            categoriesCards(context),
          ],
        ));
  }

  Widget categoriesCards(BuildContext context) {
    return FutureBuilder(
      future: categories,
      builder:
          (BuildContext context, AsyncSnapshot<Stream<Category>> snapshot) {
        if (snapshot.hasData) {
          return fillCategory(context);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget fillCategory(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(0, 75, 0, 0),
      children: _controller.categories
          .map((category) => Flexible(
                child: categoryCard(category),
              ))
          .toList(),
    );
  }

  Widget categoryCard(Category model) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(37.0)),
        elevation: 20.0,
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
        child: new InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/ProductCategory');
          },
          child: Image.network(
            model.image_url,
            fit: BoxFit.fill,
          ),
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
