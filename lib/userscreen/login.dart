import 'package:com/tools/app_data.dart';
import 'package:com/tools/app_tools.dart';
import 'package:com/tools/firebase_method.dart';
import 'package:com/userscreen/signup.dart';
import 'package:flutter/material.dart';
import 'package:com/tools/app_method.dart';

class GalleryLogin extends StatefulWidget {
  @override
  _GalleryLoginState createState() => _GalleryLoginState();
}

class _GalleryLoginState extends State<GalleryLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethod = FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context=context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: false,
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            appTextField(
              isPassword: false,
              sidePadding: 18.0,
              textHint: 'Email Address',
              textIcon: Icons.email,
              Controller: email,
            ),
            SizedBox(
              height: 10.0,
            ),
            appTextField(
              isPassword: true,
              sidePadding: 18.0,
              textHint: 'Password',
              textIcon: Icons.lock,
              Controller: password,
            ),
            SizedBox(
              height: 10.0,
            ),
            appButton(
                onbtnLicked: verifyLoggin,
                btnText: 'Login',
                btnColor: Colors.white,
                btnPadding: 18),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return SignUp();
                  }));
                },
                child: Text(
                  'Not Registered ? Sign up here',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  verifyLoggin() async {
    if (email.text == '') {
      showSnackBar('Email cannot be empty', scaffoldKey);
      return;
    }
    if (password.text == '') {
      showSnackBar('Password cannot be empty', scaffoldKey);
      return;
    }
    displayProgressDialog(context);
    String response = await appMethod.logginUser(
        email: email.text.toLowerCase(), password: password.text.toLowerCase());
    if (response == succsesful) {
      closeProgressDialog(context);
      Navigator.of(context).pop(true);
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
