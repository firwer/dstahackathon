import 'package:flutter/material.dart';

const String placeholder =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent elementum interdum arcu, finibus hendrerit eros posuere vel. Nunc odio libero, dapibus quis blandit tristique, euismod quis nisl. Phasellus dapibus turpis metus, ut convallis erat interdum in. Fusce nec placerat metus. Morbi nec aliquet metus. In hac habitasse platea dictumst. Ut rutrum vestibulum facilisis. Nulla lacinia nibh imperdiet rutrum accumsan. Aliquam ut aliquet orci. Duis eget quam vitae odio suscipit posuere. Nunc cursus, turpis vel euismod lobortis, nisi tortor viverra arcu, vel iaculis diam odio sit amet neque';

class coursePage extends StatefulWidget {
  const coursePage(this.t);

  final String t;

  @override
  State<coursePage> createState() => _coursePageState(this.t);
}

class _coursePageState extends State<coursePage> {
  _coursePageState(this.t);

  String t;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.t)), body: Text(placeholder));
  }
}
