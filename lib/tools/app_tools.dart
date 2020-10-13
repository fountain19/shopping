import 'dart:async';
import 'dart:io';

import 'package:com/tools/progressdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Widget appTextField(
    {IconData textIcon,
    String textHint,
    bool isPassword,
    TextEditingController Controller,
    double sidePadding,
    TextInputType textType}) {
  sidePadding == null ? sidePadding = 0.0 : sidePadding;
  textHint == null ? textHint = "" : textHint;

  return Padding(
    padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: TextField(
        controller: Controller,
        obscureText: isPassword == null ? false : isPassword,
        keyboardType: textType == null ? TextInputType.text : textType,
        decoration: InputDecoration(
          hintText: textHint,
          prefixIcon: textIcon == null
              ? Container()
              : Icon(
                  textIcon,
                ),
//   there are two choice to delete the output border
//          border: OutlineInputBorder(
//              borderSide: BorderSide.none),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget appButton(
    {String btnText,
    double btnPadding,
    Color btnColor,
    VoidCallback onbtnLicked}) {
  btnColor == null ? btnColor = Colors.white : btnColor;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnText == null ? btnText = '' : btnText;
  return Padding(
    padding: EdgeInsets.all(btnPadding),
    child: RaisedButton(
      onPressed: onbtnLicked,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
              child: Text(
            btnText,
            style: TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    ),
  );
}

Widget productTextField(
    {String textTitle,
    String textHint,
    double height,
    TextEditingController controller,
    TextInputType textType,int maxLine}) {
  textHint == null ? textHint = "Enter Hint" : textHint;
  textTitle == null ? textTitle = "Enter Title" : textTitle;

  height == null ? height = 50.0 : height;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textTitle,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: TextField(
              controller: controller,
              keyboardType: textType == null ? TextInputType.text : textType,maxLines: maxLine==null?null:maxLine,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: textHint),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget productDropDown(
    {String selectedItem,
    String textTitle,
    List<DropdownMenuItem<String>> dropDownItems,
    ValueChanged<String> changedDropDownItems}) {
  textTitle == null ? textTitle = "Enter Title" : textTitle;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textTitle,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: selectedItem,
              items: dropDownItems,
              onChanged: changedDropDownItems,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget MultiImagePickerList(
    {List<File> imageList, VoidCallback removeNewImage(int position)}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: imageList == null || imageList.length == 0
        ? Container()
        : SizedBox(
            height: 150.0,
            child: ListView.builder(
                itemCount: imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(100),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(imageList[index])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: CircleAvatar(
                            backgroundColor: Colors.red[600],
                            child: IconButton(
                              color: Colors.red,
                              icon: Icon(
                                Icons.clear,
                                color: Colors.white,
                              ), onPressed: () { removeNewImage(index); },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
  );
}

List<DropdownMenuItem<String>> buildAndGetDropDownItems(List size) {
  List<DropdownMenuItem<String>> items = List();
  for (String size in size) {
    items.add(DropdownMenuItem(value: size, child: Text(size)));
  }
  return items;
}

showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(message),
  ));
}

displayProgressDialog(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return ProgressDialog();
  }));
}

closeProgressDialog(BuildContext context) {
  Navigator.pop(context);
}

writeDataLocally({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

writeBoolDataLocally({String key, bool value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setBool(key, value);
}

getDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

getStringDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getString(key);
}

getBoolDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getBool(key) == null ? false : localData.getBool(key);
}

clearDataLocally() async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.clear();
}
