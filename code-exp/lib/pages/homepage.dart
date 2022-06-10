import 'package:code_exp/AuthService.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// Homepage will be shown by default if user not logged in

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool valid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.darken),
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MyArmyPal",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 55),
                  ),
                  Text("Your All-In-One Lifestyle App",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            Positioned(
              top: 550,
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 60,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0XFF4d7753),
                      borderRadius: BorderRadius.circular(30)),
                ),
                onTap: () {
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return BottomPanel(
                          signin: true,
                        );
                      });
                  // Show Sign In Sheet
                },
              ),
            ),
            Positioned(
              top: 630,
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 60,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color(0XFF4d7753),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                ),
                onTap: () {
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return BottomPanel(
                          signin: false,
                        );
                      });
                },
              ),
            )
          ],
        ));
  }
}

class BottomPanel extends StatefulWidget {
  BottomPanel({
    Key? key,
    required this.signin,
  }) : super(key: key);
  final bool signin;

  @override
  State<BottomPanel> createState() => _BottomPanelState();
}

class _BottomPanelState extends State<BottomPanel> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  String response = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: MediaQuery.of(context).size.height * 0.45 +
            MediaQuery.of(context).viewInsets.bottom,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 60, color: Colors.grey.shade800),
            widget.signin
                ? Text(
                    'User Login',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                : Text(
                    'User Sign Up',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
            SizedBox(height: 15),
            userInput(emailController, 'Email', TextInputType.emailAddress),
            userInput(
                passwordController, "Password", TextInputType.visiblePassword),
            SizedBox(height: 7),
            Text(response, style: TextStyle(color: Colors.red)),
            SizedBox(height: 8),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                child: widget.signin
                    ? Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                decoration: BoxDecoration(
                    color: Color(0XFF4d7753),
                    borderRadius: BorderRadius.circular(30)),
              ),
              onTap: () async {
                if (widget.signin) {
                  print('pressed');
                  String? result = await context.read<AuthService>().signIn(
                      email: emailController.text,
                      password: passwordController.text);
                  print("RESULT: ${result}");

                  if (result != "Signed In") {
                    response = result!;
                  } else {
                    Navigator.of(context).pop();
                  }
                  setState(() {});
                  if (response == null) {}
                } else {
                  String? result = await context.read<AuthService>().signUp(
                      email: emailController.text,
                      password: passwordController.text);
                  print(result);
                  if (result != 'Signed Up') {
                    response = result!;
                  } else {
                    Navigator.of(context).pop();
                  }
                  setState(() {});
                }
              },
            ),
          ],
        ));
  }
}

Widget userInput(TextEditingController userInput, String hintTitle,
    TextInputType keyboardType) {
  return Container(
    height: 55,
    margin: EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
        color: Colors.grey.shade300, borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
      child: TextField(
        controller: userInput,
        autocorrect: false,
        enableSuggestions: false,
        autofocus: false,
        decoration: InputDecoration.collapsed(
          hintText: hintTitle,
          hintStyle: TextStyle(
              fontSize: 18,
              color: Color(0XFFC4C4C4),
              fontStyle: FontStyle.italic),
        ),
        keyboardType: keyboardType,
      ),
    ),
  );
}
