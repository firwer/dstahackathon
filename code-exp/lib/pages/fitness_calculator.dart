import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:code_exp/Calculations.dart';

// This page holds the fitness calculator page widget (From BottomNav in Homepage)

class fitnessCalculator extends StatefulWidget {
  const fitnessCalculator({Key? key}) : super(key: key);

  @override
  State<fitnessCalculator> createState() => _fitnessCalculatorState();
}

class _fitnessCalculatorState extends State<fitnessCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IPPT Calculator'),
      ),
      body: const Center(
        child: Text('WIP'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
    );
  }
}
