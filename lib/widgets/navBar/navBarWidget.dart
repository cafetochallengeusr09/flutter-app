import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:emida/widgets/navs/categoryWidget.dart';
import 'package:emida/widgets/navs/favoriteWidget.dart';
import 'package:emida/widgets/navs/homeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        tooltip: "Chatea con la flor del trabajo",
        onPressed: () {
        },
        child: Icon(Icons.chat_bubble_outline),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      key: _drawerKey,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              _drawerKey.currentState.openDrawer();
            },
            icon: Icon(
              Icons.clear_all,
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
                    "Angelica Pelaez",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
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
              homeWidget(),
              categoryWidget(),
              favoriteWidget(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        containerHeight: 80,
        itemCornerRadius: 30.0,
        iconSize: 25,
        onItemSelected: (index) {
          setState(() => currentIndex = index);
          pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              title: Text('Categories'),
              icon: Icon(Icons.apps),
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              title: Text('Favorite'),
              icon: Icon(Icons.favorite),
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.grey),
        ],
      ),
    );
  }
}
