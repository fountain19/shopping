import 'package:flutter/material.dart';
class GalleryProfile extends StatefulWidget {
  @override
  _GalleryProfileState createState() => _GalleryProfileState();
}

class _GalleryProfileState extends State<GalleryProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Profile'),
      ),
      body: Center(child: Text('MyProfile')),
    );
  }
}
