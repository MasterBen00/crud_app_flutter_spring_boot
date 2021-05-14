import 'package:api_test/provider/product_provider.dart';
import 'package:api_test/routes/app_routes.dart';
import 'package:api_test/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LaraFlutter',
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      onGenerateRoute: AppRoutes().generateRoute,
      initialRoute: homeRoute,
    );
  }
}
