import 'package:emida/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashPage> {
  SplashScreenController _controller;

  _SplashScreenState() : super(SplashScreenController()) {
    _controller = controller;
  }

  @override
  void initState() {
    Navigator.of(context).pushNamed('/Category');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffff1744),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Theme.of(context).hintColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
