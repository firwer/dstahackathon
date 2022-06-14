import 'fitness_calculator.dart';
import 'package:flutter/material.dart';
import 'package:code_exp/Formulae.dart';

class trainingPlan extends StatefulWidget {
  const trainingPlan({Key? key}) : super(key: key);

  @override
  State<trainingPlan> createState() => _trainingPlanState();
}

class _trainingPlanState extends State<trainingPlan> {
  static int bestSU = getBest(currAge, 2);
  static int bestPU = getBest(currAge, 1);
  static int ageGroup = getAgeGroup(currAge);
  static String aBestRun = bestRun[ageGroup - 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Customised FITPlan'),
          backgroundColor: Color(0XFF4d7753),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Repetition is king'),
          ],
        ));
  }
}
