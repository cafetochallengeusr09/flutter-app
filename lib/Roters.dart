import 'package:emida/pages/CategoryTabPage.dart';
import 'package:emida/pages/HomePage.dart';
import 'package:emida/pages/ProductViewPage.dart';
import 'package:emida/pages/ProductsCategoryPage.dart';
import 'package:emida/pages/SplashPage.dart';
import 'package:flutter/material.dart';

import 'commons/model/RouteArgument.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/Home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/Category':
        return MaterialPageRoute(builder: (_) => CategoryTabPage());
      case '/ProductCategory':
        return MaterialPageRoute(builder: (_) => ProductsCategoryPage());
      case '/ProductView':
        return MaterialPageRoute(
            builder: (_) =>
                ProductViewPage(routeArgument: args as RouteArgument));
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
