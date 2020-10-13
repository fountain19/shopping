import 'package:flutter/material.dart';
class AppOrders extends StatefulWidget {
  @override
  _AppOrdersState createState() => _AppOrdersState();
}

class _AppOrdersState extends State<AppOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('AppOrders'),
      ),
      body: Center(child: Text('AppOrders')),
    );
  }
}
