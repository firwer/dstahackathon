import 'package:flutter/material.dart';
import './CanteenMenu.dart';

class EcanteenScreen extends StatefulWidget {
  const EcanteenScreen({Key? key}) : super(key: key);

  @override
  State<EcanteenScreen> createState() => _EcanteenScreenState();
}

class _EcanteenScreenState extends State<EcanteenScreen> {
  void goToMenu(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return Menu();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Self Pickup Services')),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Container(
                  child: Text(
                    'Select your camp',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text('Jurong Camp'),
                      Container(
                        height: 150,
                        child: Image.asset(
                          'assets/images/Jurong_Camp.jpg',
                          fit: BoxFit.cover,
                        ),
                      )
                    ]),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(children: <Widget>[
                    Text('Jurong Camp'),
                    Container(
                      height: 150,
                      child: Image.asset(
                        'assets/images/Jurong_Camp.jpg',
                        fit: BoxFit.cover,
                      ),
                    )
                  ]),
                ),
                Card(
                  elevation: 5,
                  child: Column(children: <Widget>[
                    Text('Jurong Camp'),
                    Container(
                      height: 150,
                      child: Image.asset(
                        'assets/images/Jurong_Camp.jpg',
                        fit: BoxFit.cover,
                      ),
                    )
                  ]),
                ),
                Card(
                  elevation: 5,
                  child: Column(children: <Widget>[
                    Text('Jurong Camp'),
                    Container(
                      height: 150,
                      child: Image.asset(
                        'assets/images/Jurong_Camp.jpg',
                        fit: BoxFit.cover,
                      ),
                    )
                  ]),
                ),
              ],
            )));
  }
}
