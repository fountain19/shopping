import 'package:flutter/material.dart';
class GalleryNotifications extends StatefulWidget {
  @override
  _GalleryNotificationsState createState() => _GalleryNotificationsState();
}

class _GalleryNotificationsState extends State<GalleryNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Notifications'),
      ),
      body: Center(child: Text('MyNotifications')),
    );
  }
}
