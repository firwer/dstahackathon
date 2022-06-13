import 'package:flutter/material.dart';

import './CanteenMenu.dart';

class echecklistScreen extends StatefulWidget {
  const echecklistScreen({Key? key}) : super(key: key);

  @override
  State<echecklistScreen> createState() => _echecklistScreenState();
}

class _echecklistScreenState extends State<echecklistScreen> {
  void goToMenu(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return Menu();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NS-Callup Maria Services'),
          backgroundColor: Color(0XFF4d7753),
        ),
        body: Text('WIP'));
  }
}
