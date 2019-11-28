import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String appBarTitle;
  final Widget bodyWidget;
  MainLayout({this.appBarTitle, this.bodyWidget});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: bodyWidget,
    ));
  }
}
