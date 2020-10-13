import 'package:flutter/material.dart';
class SearchData extends StatefulWidget {
  @override
  _SearchDataState createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Search Data'),
      ),
      body: Center(child: Text('Search Data')),
    );
  }
}
