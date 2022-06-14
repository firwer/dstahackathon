import 'package:code_exp/AuthService.dart';
import 'package:code_exp/Formulae.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../myUser.dart';

// This page holds the user profile details and settings

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double rowSize = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.account_circle, size: 150, color: Color(0xff8d8e98)),
            Text(Provider.of<myUser>(context).name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.all(10.0)),
            //Personal Data
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Container(
                    height: rowSize,
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            width: 75,
                            child: Text(
                              'Height:',
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('${Provider.of<myUser>(context).height} cm'),
                        ],
                      ),
                    ),
                  ),
                  //Weight card
                  Container(
                    height: rowSize,
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            width: 75,
                            child: Text(
                              'Weight:',
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('${Provider.of<myUser>(context).weight} kg'),
                        ],
                      ),
                    ),
                  ),
                  //BMI Card
                  Container(
                    height: rowSize,
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            width: 75,
                            child: Text(
                              'BMI:',
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(calculateBMI(Provider.of<myUser>(context).height,
                              Provider.of<myUser>(context).weight)),
                        ],
                      ),
                    ),
                  ),

                  // Empty Placeholder
                  SizedBox(
                    height: 0,
                  ),
                  //Reservist time card
                  //('Next Reservist Date'),
                  Container(
                    height: rowSize,
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: Text(
                              'Next Reservist Date:',
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Mob Manning'),
                              Text(
                                '31 July 2022',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.all(10.0)),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                color: Color(0XFF4d7753),
              ),
              onTap: () {
                context.read<AuthService>().signOut();
              },
            )
          ],
        ));
  }
}
