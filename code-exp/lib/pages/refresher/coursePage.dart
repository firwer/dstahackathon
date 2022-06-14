import 'package:flutter/material.dart';

const String placeholder = 'To be updated by operations/training branch';

class coursePage extends StatefulWidget {
  const coursePage(this.t);

  final String t;

  @override
  State<coursePage> createState() => _coursePageState(this.t);
}

class _coursePageState extends State<coursePage> {
  _coursePageState(this.t);

  String t;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.t),
          backgroundColor: Color(0XFF4d7753),
        ),
        body: Center(child: Text(placeholder)));
  }
}
