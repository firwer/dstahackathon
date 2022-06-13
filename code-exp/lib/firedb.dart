// Static class contains all methods for CRUD for Firebase DB
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_exp/myUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class firedb {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static void createUser(
      String name, String gender, int height, double weight) async {
    print(FirebaseAuth.instance.currentUser!.uid);
    await db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': name,
      'height': height,
      'weight': weight,
      'gender': gender
    });
  }

  static void getUserInfo(BuildContext context) async {
    print('Getting User info');
    await db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((response) {
      Provider.of<myUser>(context, listen: false).updateUserInfo(
          response['name'],
          response['height'],
          response['weight'],
          response['gender']);
    });
  }
}
