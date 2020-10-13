import 'package:flutter/material.dart';
class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withAlpha(200),
      child: Center(child: Container(
        padding: EdgeInsets.all(30),
        child: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(height: 15,),
              Text('Please Wait',style: TextStyle(color: Colors.white),),
            ],
          )),
        ),
      )),
    );
  }
}
