import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelperAppBar {
  static Widget AppBarWithBody(BuildContext context, Widget widget,
      GlobalKey<ScaffoldState> scaffoldKey) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        tooltip: "Chatea con la flor del trabajo",
        onPressed: () {},
        child: Icon(Icons.chat_bubble_outline),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState.openDrawer();
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
        children: <Widget>[widget],
      ),
    );
  }

  static Widget onlyAppBar(
      BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/Home');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.0,
            color: Colors.white70,
          ),
        ));
  }

  static Widget onlyAppBarTransparent(
      BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/Home');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 35.0,
            color: Colors.white70,
          ),
        ));
  }

  static Widget AppBarNoBody(
      BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          tooltip: "Chatea con la flor del trabajo",
          onPressed: () {},
          child: Icon(Icons.chat_bubble_outline),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        key: scaffoldKey,
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState.openDrawer();
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
        ));
  }
}
