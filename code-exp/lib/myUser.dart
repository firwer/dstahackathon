import 'dart:io';
import 'package:code_exp/firedb.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "dart:math";

// To use the var/methods here: Type "Provider.of<myUser>(context).<var/method>"
// To use it on buttons: Type: Provider.of<myUser>(context, listen: false).<var/method>"

class myUser extends ChangeNotifier {
  String name = "";
  int height = 0;
  double weight = 0;
  String gender = "";

  double getBMI(int height, double weight) {
    return weight / pow(height, 2) * 1.0;
  }

  void updateUserInfo(
      String userName, int userHeight, double userWeight, String userGender) {
    name = userName;
    height = userHeight;
    weight = userWeight;
    gender = userGender;
    notifyListeners();
  }
}
