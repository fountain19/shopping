
import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:com/tools/app_tools.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'app_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:com/tools/app_data.dart';



class FirebaseMethods implements AppMethods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  List<String> imagesUrl = List();
  List<File> imageList;




  @override
  Future<String> createUserAccount(
      {String fullName, String phone, String email, String password}) async {
    // TODO: implement createUserAccount
    AuthResult user;
    try {
      user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on PlatformException catch (e) {
      //print(e.details);
      return errorMSG(e.details);
    }

    try {
      if (user != null) {
        await firestore.collection(usersData).document(userId).setData({
          userId: userId,
          acctFullName: fullName,
          userEmail: email,
          userPassword: password,
          phoneNumber: phone,
        });
        writeDataLocally(key: userId, value: userId);
        writeDataLocally(key: fullName, value: fullName);
        writeDataLocally(key: userEmail, value: email);
        writeDataLocally(key: userPassword, value: password);
      }
    } on PlatformException catch (e) {
      print(e.details);
      return errorMSG(e.details);
    }
    return user == null ? errorMSG('Error') : succsesfulMSG();
  }

  @override
  Future<String> logginUser({String email, String password}) async {
    // TODO: implement

    AuthResult user;

    try {
      user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        DocumentSnapshot userInfo = await getUserInfo(userId);
        writeDataLocally(key: acctFullName, value: userInfo[acctFullName]);
        writeDataLocally(key: userEmail, value: userInfo[userEmail]);
        writeDataLocally(key: phoneNumber, value: userInfo[phoneNumber]);
        writeDataLocally(key: photoUrl, value: userInfo[photoUrl]);
        writeBoolDataLocally(key: loggedIn, value: true);
        print(userInfo[userEmail]);
      }
    } on PlatformException catch (e) {
      print(e.details);
      return errorMSG(e.message);
    }

    return user == null ? errorMSG('Error') : succsesfulMSG();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }

  Future<String> succsesfulMSG() async {
    return succsesful;
  }

  Future<String> errorMSG(String e) async {
    return e;
  }

  @override
  Future<bool> logOutUser() async {
    // TODO: implement logOutUser
    await _auth.signOut();
    await clearDataLocally();
    return complete();
  }


  @override
  Future<DocumentSnapshot> getUserInfo(String userId) async {
    // TODO: implement getUserInfo
    return await firestore.collection(usersData).document(userId).get();
  }

  @override
  Future<String> addNewProduct({Map newProduct}) async {
    // TODO: implement addNewProduct
    String documentID;
    await firestore.collection(appProducts).add(newProduct).then((
        documentRef) => documentID = documentRef.documentID);
    return documentID;
  }


  @override
  Future<bool> updateProductImages({String docID, List<String> data}) async {
    // TODO: implement updateProductImages
    bool msg;
    await firestore.collection(appProducts).document(docID).updateData(
        {productImages: data}).whenComplete(() => msg = true);
    return msg;
  }

  @override
  Future<List<String>> uploadProductImages(
      {List<File> imageList, String docID}) async {
//    List<String> imagesUrl = List();



    try {
      for (int s = 0; s < imageList.length; s++) {

        StorageReference storageReference = FirebaseStorage.instance.ref()
            .child(appProducts)
            .child(docID)
            .child(docID + '$s.jpg');



        StorageUploadTask uploadTask = storageReference.putFile((imageList[s]));
        StorageTaskSnapshot taskSnapshot= await uploadTask.onComplete;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        imagesUrl.add(downloadUrl.toString());
      }

    } on PlatformException catch (e) {
      imagesUrl.add(error);

      print(e.details);
    }
    return imagesUrl;
  }


}

//class UploadTaskSnapshot {
//  UploadTaskSnapshot({this.downloadUrl});
//  final Uri downloadUrl;
//}












