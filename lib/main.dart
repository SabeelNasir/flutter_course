import 'package:flutter/material.dart';
import './product_manager.dart';
import './layouts/drawer.dart';

void main() =>
    runApp(MyApp()); // in one line if have only one statement in function

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        accentColor: Colors.deepPurple,
      ),
      home: Scaffold(
        // new page for app having multiple widgets
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: ProductManager(),
        drawer: DrawerLayout(),
      ),
    );
  }
}
