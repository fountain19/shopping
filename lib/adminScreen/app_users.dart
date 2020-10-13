import 'package:flutter/material.dart';
class AppUsers extends StatefulWidget {
  @override
  _AppUsersState createState() => _AppUsersState();
}

class _AppUsersState extends State<AppUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('AppUsers'),
      ),
      body: Center(child: Text('AppUsers')),
    );
  }
}
