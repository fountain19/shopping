import 'package:flutter/material.dart';
class AppProducts extends StatefulWidget {
  @override
  _AppProductsState createState() => _AppProductsState();
}

class _AppProductsState extends State<AppProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('AppProducts'),
      ),
      body: Center(child: Text('AppProducts')),
    );
  }
}
