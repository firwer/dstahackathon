import 'dart:io';
import 'package:flutter/material.dart';
import "dart:math";

class myUser {
  static String name = "";
  static int height = 0;
  static double weight = 0;
  static String gender = "";

  static double getBMI(int height, double weight) {
    return weight / pow(height, 2) * 1.0;
  }
}
