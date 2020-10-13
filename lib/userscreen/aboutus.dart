import 'package:flutter/material.dart';
class GalleryAboutUs extends StatefulWidget {
  @override
  _GalleryAboutUsState createState() => _GalleryAboutUsState();
}

class _GalleryAboutUsState extends State<GalleryAboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('AboutUs'),
      ),
      body: Center(child: Text('AboutUs')),
    );
  }
}
