import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:emida/commons/ApiHttpRequestBase.dart';
import 'package:emida/controller/home_controller.dart';
import 'package:emida/pages/CategoryTabPage.dart';
import 'package:emida/widgets/navs/favoriteWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'HomeTabPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  int currentIndex = 0;
  PageController pageController;
  HomeController _controller;

  _HomePageState() : super(HomeController()) {
    _controller = controller;
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _controller.scaffoldKey,
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                _controller.scaffoldKey.currentState.openDrawer();
              },
              icon: Icon(
                Icons.sort,
                size: 35.0,
                color: Colors.white,
              ),
            )),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    ),
                    Text(
                      "Juan Añez",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(20.0, 40.0, 0, 20.0),
                /*
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile.png"),
                        fit: BoxFit.cover))*/
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                leading: Icon(
                  Icons.equalizer,
                  size: 40.0,
                ),
                subtitle: Text(
                  "One breve description de esta caracteristica aqui",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                title: Text(
                  'Reports',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                leading: Icon(
                  Icons.settings,
                  size: 40.0,
                ),
                subtitle: Text(
                  "One breve description de esta caracteristica aqui",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                title: Text(
                  'Settings',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                child: Text(
                  "Contact Us",
                  style: TextStyle(color: Colors.grey, fontSize: 22.0),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                leading: Icon(
                  Icons.notifications_active,
                  size: 40.0,
                ),
                subtitle: Text(
                  "One breve description de esta caracteristica aqui",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                title: Text(
                  'Notifications',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        body: new Stack(
          children: <Widget>[
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              children: <Widget>[
                HomeTabPage(),
                CategoryTabPage(),
                favoriteWidget(),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          tooltip: "Chatea con la flor del trabajo",
          onPressed: () {
            settingModalBottomSheet(context);
            ApiHttpRequestBase.fetchAlbum()
                .then((value) => {print(value.toString())})
                .catchError((onError, _) => {print(onError)});
          },
          child: Icon(Icons.shopping_cart),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 30),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavyBar(
                selectedIndex: currentIndex,
                showElevation: true,
                containerHeight: 73,
                itemCornerRadius: 37.0,
                iconSize: 22,
                onItemSelected: (index) {
                  setState(() => currentIndex = index);
                  pageController.jumpToPage(index);
                },
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                      title: Text('Inicio'),
                      icon: Icon(Icons.home),
                      activeColor: Theme.of(context).primaryColor,
                      inactiveColor: Colors.grey),
                  BottomNavyBarItem(
                      title: Text('Categorias'),
                      icon: Icon(Icons.apps),
                      activeColor: Theme.of(context).primaryColor,
                      inactiveColor: Colors.grey),
                  BottomNavyBarItem(
                      title: Text('Favoritos'),
                      icon: Icon(Icons.favorite),
                      activeColor: Theme.of(context).primaryColor,
                      inactiveColor: Colors.grey),
                ],
              ),
            )));
  }

  void settingModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, // or some other color
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: new Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: new ListTile(
                      leading: new Icon(Icons.account_circle, size: 32.0),
                      title: new Text(
                        'My Account',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onTap: () => {}),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: new ListTile(
                    leading: new Icon(Icons.message, size: 32.0),
                    title: new Text('Chat', style: TextStyle(fontSize: 16.0)),
                    onTap: () => {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: new ListTile(
                    leading: new Icon(Icons.settings, size: 32.0),
                    title:
                        new Text('Setting', style: TextStyle(fontSize: 16.0)),
                    onTap: () => {},
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
