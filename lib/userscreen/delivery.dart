import 'package:flutter/material.dart';
class GalleryDelivery extends StatefulWidget {
  @override
  _GalleryDeliveryState createState() => _GalleryDeliveryState();
}

class _GalleryDeliveryState extends State<GalleryDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Delivery '),
      ),
      body: Center(child: Text('MyDelivery ')),
    );
  }
}
