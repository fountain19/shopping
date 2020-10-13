import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com/tools/firebase_method.dart';




abstract class AppMethods {
  Future<String> logginUser({String email,String password});
  Future<String> createUserAccount({String fullName,String phone,String email,String password});
Future<bool> logOutUser();
Future <DocumentSnapshot> getUserInfo(String userId);
Future<String> addNewProduct({Map newProduct});
 Future<List<String>>uploadProductImages({List<File> imageList,String docID});
  Future<bool> updateProductImages({String docID,List<String> data});

}



