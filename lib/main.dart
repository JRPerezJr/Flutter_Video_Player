import 'package:flutter/material.dart';
import 'homepage.dart';
import 'page_two.dart';

void main() => runApp(MyApp());

var routes = <String, WidgetBuilder>{
  '/pageTwo': (BuildContext context) => PageTwo(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Background Video',
      theme: ThemeData(
        primaryColor: Color(0xffffffff),
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}
