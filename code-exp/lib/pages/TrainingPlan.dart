import 'fitness_calculator.dart';
import 'package:flutter/material.dart';
import 'package:code_exp/Formulae.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:code_exp/Calculations.dart';

class trainingPlan extends StatefulWidget {
  const trainingPlan({Key? key}) : super(key: key);

  @override
  State<trainingPlan> createState() => _trainingPlanState();
}

class _trainingPlanState extends State<trainingPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Customised FITPlan'),
          backgroundColor: Color(0XFF4d7753),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Text('Tips for Fitness:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        'Repetition is king',
                        style: TextStyle(
                          fontSize: 40,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.black,
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        'Repetition is king',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        'Consistency is key',
                        style: TextStyle(
                          fontSize: 40,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.black,
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        'Consistency is key',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('View your Training Schedule Below',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                height: 500,
                child: SfCalendar(
                  view: CalendarView.week,
                  dataSource: TrainingDataSource(getAppointments()),
                ),
              )
            ],
          ),
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
      recurrenceRule: 'FREQ=DAILY;INTERVAL=$freq'));
  trainings.add(Appointment(
      startTime: DateTime(today.year, today.month, today.day, 13),
      endTime: DateTime(today.year, today.month, today.day, 15),
      subject: 'Metabolic Circuit',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=${freq + 1}'));
  trainings.add(Appointment(
      startTime: DateTime(today.year, today.month, today.day + 1, 18),
      endTime: DateTime(today.year, today.month, today.day + 1, 20),
      subject: 'Mock IPPT',
      color: Colors.red,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7'));
  return trainings;
}

class TrainingDataSource extends CalendarDataSource {
  TrainingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
