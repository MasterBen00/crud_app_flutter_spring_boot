import 'package:api_test/routes/route_names.dart';
import 'package:api_test/screens/create.dart';
import 'package:api_test/screens/edit.dart';
import 'package:api_test/screens/home.dart';
import 'package:api_test/screens/view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route<dynamic> generateRoute(RouteSettings settings) {
    Map arg = settings.arguments;

    PageRoute _go(Widget child) {
      return MaterialPageRoute(builder: (context) => child);
    }

    switch (settings.name) {
      case homeRoute:
        return _go(Home());

      case edit:
        return _go(Edit());

      case view:
        return _go(View());

      case create:
        return _go(CreateProduct());

      default:
        return _go(Home());
    }
  }
}
