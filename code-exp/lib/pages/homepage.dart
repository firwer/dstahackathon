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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                      Colors.black.withOpacity(0.5), BlendMode.darken),
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
                  // Show Sign Up Sheet
                },
              ),
            )
          ],
        ));
  }
}


//  valid
//                         ? SizedBox(
//                             height: 0,
//                           )
//                         : Text("Invalid Login!"),
//                     TextField(
//                       controller: emailController,
//                       decoration: InputDecoration(labelText: 'Email'),
//                     ),
//                     TextField(
//                       controller: passwordController,
//                       decoration: InputDecoration(labelText: 'Password'),
//                     ),
//                     ElevatedButton(
//                         child: Text("Sign In"),
//                         onPressed: () async {
//                           print('pressed');
//                           String? response = await context
//                               .read<AuthService>()
//                               .signIn(
//                                   email: emailController.text,
//                                   password: passwordController.text);
//                           print(response);
//                           if (response == null) {
//                             setState(() {
//                               valid = true;
//                             });
//                           }
//                         })