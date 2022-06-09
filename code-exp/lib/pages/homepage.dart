import 'package:code_exp/AuthService.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Homepage will be shown by default if user not logged in

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool valid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        valid
            ? SizedBox(
                height: 0,
              )
            : Text("Invalid Login!"),
        TextField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(labelText: 'Password'),
        ),
        ElevatedButton(
            child: Text("Sign In"),
            onPressed: () async {
              print('pressed');
              String? response = await context.read<AuthService>().signIn(
                  email: emailController.text,
                  password: passwordController.text);
              print(response);
              if (response == null) {
                setState(() {
                  valid = true;
                });
              }
            })
      ],
    ));
  }
}
