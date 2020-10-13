
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'userscreen/myhomepage.dart';


void main() {
  runApp(Shopping());
}

class Shopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        theme: ThemeData()
            .copyWith(backgroundColor: Colors.green, primaryColor: Colors.green),
        home: MyHomePage(),


    );
  }
}


