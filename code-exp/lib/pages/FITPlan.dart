// IPPT Ez System Page

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FITPlan extends StatefulWidget {
  const FITPlan({Key? key}) : super(key: key);

  @override
  State<FITPlan> createState() => _FITPlanState();
}

class _FITPlanState extends State<FITPlan> {
  double currSitup = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FITPlan System'),
        backgroundColor: Color(0XFF4d7753),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text('What is your current IPPT Performance?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0XFF4d7753),
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        ListTile(
          leading: Image(image: AssetImage('assets/images/sit-up-icon.png')),
          title: Text('Sit Up'),
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
            leading: Image(image: AssetImage('assets/images/push-up-icon.png')),
            title: Text('Push Up')),
        ListTile(
            leading: Image(image: AssetImage('assets/images/running_man.jpg')),
            title: Text('Running 2.4KM'))
      ]),
    );
  }
}
