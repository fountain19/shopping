import 'package:flutter/material.dart';
class Privilages extends StatefulWidget {
  @override
  _PrivilagesState createState() => _PrivilagesState();
}

class _PrivilagesState extends State<Privilages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Privilages'),
      ),
      body: Center(child: Text('Privilages')),
    );
  }
}
