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
        appBar: AppBar(
          title: Text('Self Pickup Services'),
          backgroundColor: Color(0XFF4d7753),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Container(
                  child: Text(
                    'Select your camp',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0XFF4d7753),
                    ),
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
                      Text(
                        'NSC',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Nee Soon Camp',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'AQC',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Amoy Quee Camp',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'BC1',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Bedok Camp 1',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'BD2',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Bedok Camp 2',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'CC',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Clementi Camp',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'JC1',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Jurong Camp 1',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'JC2',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Jurong Camp 2',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'KC2',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Kranji Camp 2',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'KC3',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Kranji Camp 3',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'SAFTI',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('SAFTI Military Institute',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () => goToMenu(context),
                  child: Card(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Text(
                        'PRC',
                        style:
                            TextStyle(fontSize: 40, color: Color(0XFF4d7753)),
                      ),
                      Text('Pasir Ris Camp',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
              ],
            )));
  }
}
