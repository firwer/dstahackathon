import 'package:code_exp/pages/checklist/checklistData.dart';
import 'package:flutter/material.dart';

Color selectedColor = Color(0xFFC8E6C9);
Color nonSelectedColor = Color(0xA0C8E6C9);

IconData selected = Icons.check_box;
IconData nonSelected = Icons.check_box_outline_blank;

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

final todos = List.generate(
  20,
  (i) => Todo(
    'Todo $i',
    'A description of what needs to be done for Todo $i',
  ),
);

class echecklistScreen extends StatefulWidget {
  const echecklistScreen({Key? key}) : super(key: key);

  @override
  State<echecklistScreen> createState() => _echecklistScreenState();
}

class _echecklistScreenState extends State<echecklistScreen> {
  bool s = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NS-Callup Maria Services'),
          backgroundColor: Color(0XFF4d7753),
        ),
        body: _buildListView());
  }

  ListView _buildListView() {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return todoCard(
              dataList.elementAt(index)[1].toString() == "true"
                  ? selectedColor
                  : nonSelectedColor,
              dataList.elementAt(index)[1].toString() == "true"
                  ? selected
                  : nonSelected,
              Text(dataList.elementAt(index)[0].toString()), () {
            setState(() {
              dataList.elementAt(index)[1].toString() == "true"
                  ? dataList.elementAt(index)[1] = "false"
                  : dataList.elementAt(index)[1] = "true";
            });
          });
        });
  }
}

class todoCard extends StatelessWidget {
  todoCard(this.c, this.i, this.cardChild, this.fn);
  final Color c;
  final Widget cardChild;
  final VoidCallback fn;
  final IconData i;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fn,
      child: Container(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(i),
            ),
            cardChild,
          ],
        ),
        margin: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: c,
        ),
      ),
    );
  }
}
