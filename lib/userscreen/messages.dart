import 'package:flutter/material.dart';
class GalleryMessages extends StatefulWidget {
  @override
  _GalleryMessagesState createState() => _GalleryMessagesState();
}

class _GalleryMessagesState extends State<GalleryMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Messages'),
      ),
      body: Center(child: Text('MyMessages')),
    );
  }
}
