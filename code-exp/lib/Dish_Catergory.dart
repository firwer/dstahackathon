import 'dart:ffi';

import 'package:flutter/material.dart';

class Dish {
  final String name;
  final double price;
  final IconData icon;
  final Color color;

  Dish(
      {required this.name,
      required this.icon,
      required this.color,
      required this.price});
}
