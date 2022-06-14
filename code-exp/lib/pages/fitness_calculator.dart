// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:code_exp/Calculations.dart';
import 'package:code_exp/Formulae.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// This page holds the fitness calculator page widget (From BottomNav in Homepage)

const bottomContainerHeight = 80.0;
const cardColor = Color(0XFF4d7753);
const cardTextStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
const cardTextStyle2 = TextStyle(
    color: Color(0xff8d8e98), fontSize: 20, fontWeight: FontWeight.bold);

class fitnessCalculator extends StatefulWidget {
  const fitnessCalculator({Key? key}) : super(key: key);

  @override
  State<fitnessCalculator> createState() => _fitnessCalculatorState();
}

int sitUps = _fitnessCalculatorState.startingSitups;
int pushUps = _fitnessCalculatorState.startingPushups;
int runIndex = _fitnessCalculatorState.startingRunIndex;
int currAge = _fitnessCalculatorState.age;
String currResult = _fitnessCalculatorState.endResult;
int freq = planFreq(currResult);

class _fitnessCalculatorState extends State<fitnessCalculator> {
  static int age = 22;
  static int startingPushups = 30;
  static int startingSitups = 30;
  static int startingRunIndex = 31;
  static int pointsPU = pointsForPushUps(age, startingPushups);
  static int pointsSU = pointsforSitUps(age, startingSitups);
  static int pointsRun = pointsforRun(age, timings[startingRunIndex]);
  static int totalPoints = pointsPU + pointsSU + pointsRun;
  static String endResult = result(totalPoints);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: ReusableCard(
            colour: cardColor,
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (age > 16) {
                        age--;
                      }
                      pointsPU = pointsForPushUps(age, startingPushups);
                      pointsSU = pointsforSitUps(age, startingSitups);
                      pointsRun = pointsforRun(age, timings[startingRunIndex]);
                      totalPoints = pointsPU + pointsSU + pointsRun;
                      currResult = endResult = result(totalPoints);
                      currAge = age;
                      freq = planFreq(currResult);
                    });
                  },
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                Text('Age: ', style: cardTextStyle),
                Text(age.toString(), style: cardTextStyle),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (age < 61) {
                        age++;
                      }
                      pointsPU = pointsForPushUps(age, startingPushups);
                      pointsSU = pointsforSitUps(age, startingSitups);
                      pointsRun = pointsforRun(age, timings[startingRunIndex]);
                      totalPoints = pointsPU + pointsSU + pointsRun;
                      currResult = endResult = result(totalPoints);
                      pushUps = startingPushups;
                      currAge = age;
                      freq = planFreq(currResult);
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: cardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Push-Ups', style: cardTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(startingPushups.toString(), style: cardTextStyle),
                    Text('|', style: cardTextStyle),
                    Text(pointsPU.toString(), style: cardTextStyle2),
                  ],
                ),
                Slider(
                    value: startingPushups.toDouble(),
                    min: 0,
                    max: 60,
                    activeColor: Colors.white,
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        startingPushups = newValue.round();
                        pointsPU = pointsForPushUps(age, startingPushups);
                        totalPoints = pointsPU + pointsSU + pointsRun;
                        currResult = endResult = result(totalPoints);
                        pushUps = startingPushups;
                        freq = planFreq(currResult);
                      });
                    }),
              ],
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: cardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Sit-Ups', style: cardTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(startingSitups.toString(), style: cardTextStyle),
                    Text('|', style: cardTextStyle),
                    Text(pointsSU.toString(), style: cardTextStyle2),
                  ],
                ),
                Slider(
                    value: startingSitups.toDouble(),
                    min: 0,
                    max: 60,
                    activeColor: Colors.white,
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        startingSitups = newValue.round();
                        pointsSU = pointsforSitUps(age, startingSitups);
                        totalPoints = pointsPU + pointsSU + pointsRun;
                        currResult = endResult = result(totalPoints);
                        sitUps = startingSitups;
                        freq = planFreq(currResult);
                      });
                    }),
              ],
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: cardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('2.4km Run', style: cardTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(timings[startingRunIndex], style: cardTextStyle),
                    Text('|', style: cardTextStyle),
                    Text(pointsRun.toString(), style: cardTextStyle2),
                  ],
                ),
                Slider(
                    value: startingRunIndex.toDouble(),
                    min: 0,
                    max: 62,
                    activeColor: Colors.white,
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        startingRunIndex = newValue.round();
                        pointsRun =
                            pointsforRun(age, timings[startingRunIndex]);
                        totalPoints = pointsPU + pointsSU + pointsRun;
                        currResult = endResult = result(totalPoints);
                        runIndex = startingRunIndex;
                        freq = planFreq(currResult);
                      });
                    }),
              ],
            ),
          ),
        ),
        Container(
          color: colorChange(endResult),
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: bottomContainerHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${totalPoints} points', style: cardTextStyle),
              Text(
                endResult,
                style: TextStyle(fontSize: 18.0, color: Color(0xff8d8e98)),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ));
  }
}
