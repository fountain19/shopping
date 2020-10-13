import 'package:flutter/material.dart';
class GalleryFavorits extends StatefulWidget {
  @override
  _GalleryFavoritsState createState() => _GalleryFavoritsState();
}

class _GalleryFavoritsState extends State<GalleryFavorits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false,
        title: Text('Favorits'),
      ),
      body: Center(child: Text('MyFavorits')),
    );
  }
}
