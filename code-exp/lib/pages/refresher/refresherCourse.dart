import 'package:flutter/material.dart';

import 'CoursesMenu.dart';

class refresherCourseScreen extends StatefulWidget {
  const refresherCourseScreen({Key? key}) : super(key: key);

  @override
  State<refresherCourseScreen> createState() => _refresherCourseScreenState();
}

class _refresherCourseScreenState extends State<refresherCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('NS Refresher Course')),
        body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: course.length,
            itemBuilder: (context, index) {
              var item = course[index];
              return Card(
                  elevation: 4.0,
                  child: Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            item.abbr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              item.name,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ]),
                      //padding used for gesture
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                              print(item.abbr + ' selected');
                            },
                          ),
                        ),
                      ),
                    ],
                  ));
            }));
  }
}
