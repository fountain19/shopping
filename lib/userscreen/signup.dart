import 'dart:math';

import 'package:com/tools/app_data.dart';
import 'package:com/tools/app_method.dart';
import 'package:com/tools/app_tools.dart';
import 'package:com/tools/firebase_method.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController re_password = TextEditingController();
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
        title: Text('Sign Up'),
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
              textHint: 'Full Name',
              textIcon: Icons.person,
              Controller: fullName,
            ),
            SizedBox(
              height: 10.0,
            ),
            appTextField(
              isPassword: false,
              sidePadding: 18.0,
              textHint: 'Phone Number',
              textIcon: Icons.phone,
              textType: TextInputType.phone,
              Controller: phoneNumber,
            ),
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
            appTextField(
              isPassword: true,
              sidePadding: 18.0,
              textHint: 'Re_Password',
              textIcon: Icons.lock,
              Controller: re_password,
            ),
            SizedBox(
              height: 10.0,
            ),
            appButton(
                onbtnLicked: verifyDetails,
                btnText: 'Create Account',
                btnColor: Colors.white,
                btnPadding: 18),
          ],
        ),
      ),
    );
  }

  verifyDetails() async {
    if (fullName.text == '') {
      showSnackBar('FullName cannot be empty', scaffoldKey);
      return;
    }
    if (phoneNumber.text == '') {
      showSnackBar('PhoneNumber cannot be empty', scaffoldKey);
      return;
    }
    if (email.text == '') {
      showSnackBar('Email cannot be empty', scaffoldKey);
      return;
    }
    if (password.text == '') {
      showSnackBar('Password cannot be empty', scaffoldKey);
      return;
    }
    if (re_password.text == '') {
      showSnackBar('RePassword cannot be empty', scaffoldKey);
      return;
    }
    if (re_password.text != password.text) {
      showSnackBar('Password don\'t match', scaffoldKey);
      return;
    }
    displayProgressDialog(context);
    String response = await appMethod.createUserAccount(
        fullName: fullName.text,
        password: password.text.toLowerCase(),
        phone: phoneNumber.text,
        email: email.text.toLowerCase());
    if (response == succsesful) {
      closeProgressDialog(context);
      Navigator.pop(context);
      Navigator.of(context).pop(true);

    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
