// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:code_exp/Formulae.dart';
import 'package:code_exp/Calculations.dart';

// This page holds the fitness calculator page widget (From BottomNav in Homepage)

const bottomContainerHeight = 80.0;
const cardColor = Color(0XFF4d7753);
const cardTextStyle =
    TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);

class fitnessCalculator extends StatefulWidget {
  const fitnessCalculator({Key? key}) : super(key: key);

  @override
  State<fitnessCalculator> createState() => _fitnessCalculatorState();
}

class _fitnessCalculatorState extends State<fitnessCalculator> {
  static int startingPushups = 30;
  static int startingSitups = 30;
  static int startingRunIndex = 31;
  static int pointsPU = pointsForPushUps(22, startingPushups);
  static int pointsSU = pointsforSitUps(22, startingSitups);
  static int pointsRun = pointsforRun(22, timings[startingRunIndex]);
  static int totalPoints = pointsPU + pointsSU + pointsRun;
  String endResult = result(totalPoints);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
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
                    Text(pointsPU.toString(),
                        style: TextStyle(
                            color: Color(0xff8d8e98),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
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
                        pointsPU = pointsForPushUps(22, startingPushups);
                        totalPoints = pointsPU + pointsSU + pointsRun;
                        endResult = result(totalPoints);
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
                    Text(pointsSU.toString(),
                        style: TextStyle(
                            color: Color(0xff8d8e98),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
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
                        pointsSU = pointsforSitUps(22, startingSitups);
                        totalPoints = pointsPU + pointsSU + pointsRun;
                        endResult = result(totalPoints);
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
                    Text(pointsRun.toString(),
                        style: TextStyle(
                            color: Color(0xff8d8e98),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
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
                        pointsRun = pointsforRun(22, timings[startingRunIndex]);
                        totalPoints = pointsPU + pointsSU + pointsRun;
                        endResult = result(totalPoints);
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



// double h1FontSize = 25.0;
// int startingAge = 0;

// agegroup(age) => Container(
//       child: Column(
//         children: [
//           Container(
//             height: 30,
//             child: Text(
//               "Age Group",
//               style: TextStyle(fontSize: h1FontSize),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton.icon(
//                 icon: Icon(Icons.arrow_left),
//                 label: Text(''),
//                 onPressed: () {
//                   if (age > 0) {
//                     age--;
//                   }
//                 },
//               ),
//               Text(age.toString(), style: TextStyle(fontSize: 20)),
//               ElevatedButton.icon(
//                 icon: Icon(Icons.arrow_right),
//                 label: Text(''),
//                 onPressed: () {
//                   age++;
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//     );

// reward() => Container(
//       padding: EdgeInsets.only(top: 40),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.network(
//               "https://image.flaticon.com/icons/png/512/3176/3176272.png",
//               height: 130),
//           Text("100", style: TextStyle(fontSize: 60))
//         ],
//       ),
//     );

// class fitnessCalculator extends StatefulWidget {
//   const fitnessCalculator({Key? key}) : super(key: key);

//   @override
//   State<fitnessCalculator> createState() => _fitnessCalculatorState();
// }

// class _fitnessCalculatorState extends State<fitnessCalculator> {
//   int pushupcount = 5;
//   int situpcount = 0;

//   void incrementCounter(count) {
//     setState(() {
//       count++;
//     });
//   }

//   void decrementCounter(count) {
//     setState(() {
//       count--;
//     });
//   }

//   station(image, name, count) => Column(children: [
//         Container(
//             padding: const EdgeInsets.all(10),
//             child: Text(name,
//                 style: TextStyle(
//                     decoration: TextDecoration.underline,
//                     fontSize: h1FontSize))),
//         Container(
//             decoration: BoxDecoration(
//                 border: Border.all(), borderRadius: BorderRadius.circular(12)),
//             child: Row(children: [
//               Expanded(
//                   flex: 1,
//                   child: Container(
//                       padding: const EdgeInsets.only(left: 15),
//                       child: Image.asset(image, height: 100))),
//               Expanded(
//                   flex: 2,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               ElevatedButton.icon(
//                                 icon: Icon(Icons.do_not_disturb_on,
//                                     color: Color(0XFF4d7753)),
//                                 onPressed: () => {
//                                   decrementCounter(count),
//                                 },
//                                 label: Text(''),
//                               ),
//                               Text(count.toString(),
//                                   style: TextStyle(fontSize: 45)),
//                               ElevatedButton.icon(
//                                 icon: Icon(Icons.add_circle,
//                                     color: Color(0XFF4d7753)),
//                                 onPressed: () => {
//                                   incrementCounter(count),
//                                 },
//                                 label: Text(''),
//                               ),
//                             ]),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               const Text("Points: "),
//                               Text(count.toString())
//                             ])
//                       ]))
//             ]))
//       ]);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IPPT Calculator'),
//         backgroundColor: Color(0XFF4d7753),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(8),
//         children: [
//           agegroup(startingAge),
//           Divider(),
//           station("assets/images/push-up-icon.png", "Push up", pushupcount),
//           station("assets/images/sit-up-icon.png", "Sit up", situpcount),
//           station("assets/images/running_man.jpg", "2.4km Run", 0000),
//           reward(),
//         ],
//       ),
//     );
//   }
// }
