import 'package:emida/pages/HomePage.dart';
import 'package:emida/Roters.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //GlobalConfiguration cfg = new GlobalConfiguration();
  //await cfg.loadFromAsset("app_settings");
  runApp(FruterApp());
}

class FruterApp extends StatefulWidget {
  // This widget is the root of your application.
//  /// Supply 'the Controller' for this application.
//  MyApp({Key key}) : super(con: Controller(), key: key);

  @override
  _FruterAppState createState() => _FruterAppState();
}

class _FruterAppState extends State<FruterApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/Home',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Ubuntu', primaryColor: Colors.deepPurple),
        home: HomePage());
  }
}
