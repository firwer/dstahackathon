// IPPT Ez System Page

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'fitness_calculator.dart';
import 'package:code_exp/Formulae.dart';
import 'package:code_exp/Calculations.dart';
import 'TrainingPlan.dart';

class FITPlan extends StatefulWidget {
  const FITPlan({Key? key}) : super(key: key);

  @override
  State<FITPlan> createState() => _FITPlanState();
}

class _FITPlanState extends State<FITPlan> {
  void goToPlan(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return trainingPlan();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FITPlan System'),
        backgroundColor: Color(0XFF4d7753),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Current Performance (Change in IPPT Calculator)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0XFF4d7753),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            ListTile(
              leading: Image.asset('assets/images/sit-up-icon.png',
                  height: 50, width: 100),
              title: Text('Sit Ups: $sitUps'),
              // trailing: Slider(
              //   value: 10,
              //   max: 60,
              //   label: currSitup.round().toString(),
              //   onChanged: (double value) {
              //     setState(() {
              //       currSitup = value;
              //     });
              //   },
              // )),
            ),
            SizedBox(height: 10),
            ListTile(
                leading: Image.asset('assets/images/push-up-icon.png',
                    height: 100, width: 100),
                title: Text('Push Ups: $pushUps')),
            ListTile(
                leading: Image.asset('assets/images/running_man.jpg',
                    height: 100, width: 100),
                title: Text('2.4km Run: ${timings[runIndex]}')),
            Container(
              color: colorChange(currResult),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(currResult, style: cardTextStyle),
                    Text(
                      'Tap to see Fitness Plan!',
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xff8d8e98)),
                    )
                  ],
                ),
                onTap: () => goToPlan(context),
              ),
            )
          ]),
    );
  }
}
