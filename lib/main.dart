import 'package:emida/widgets/navBar/navBarWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmidaSaleApp());

class EmidaSaleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Ubuntu', primaryColor: Colors.deepPurple),
        home: HomePage());
  }
}
