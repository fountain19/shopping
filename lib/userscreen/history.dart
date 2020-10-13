import 'package:flutter/material.dart';
class GalleryHistory extends StatefulWidget {
  @override
  _GalleryHistoryState createState() => _GalleryHistoryState();
}

class _GalleryHistoryState extends State<GalleryHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('History'),
      ),
      body: Center(child: Text('MyHistory')),
    );
  }
}
