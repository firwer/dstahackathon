import 'fitness_calculator.dart';
import 'package:flutter/material.dart';
import 'package:code_exp/Formulae.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
            Column(
              children: [
                Text('Tips for Fitness'),
                Text('Repetition is king'),
                Text('Consistency is key'),
                SizedBox(height: 10),
                Text('View your Training Schedule Below'),
              ],
            ),
            SfCalendar(
              view: CalendarView.week,
              dataSource: TrainingDataSource(getAppointments()),
            )
          ],
        ));
  }
}

List<Appointment> getAppointments() {
  List<Appointment> trainings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  trainings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Tabata',
      color: Colors.green,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=3'));
  return trainings;
}

class TrainingDataSource extends CalendarDataSource {
  TrainingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
