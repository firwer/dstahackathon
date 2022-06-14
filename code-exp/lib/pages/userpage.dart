import 'package:code_exp/firedb.dart';
import 'package:code_exp/pages/fitness_calculator.dart';
import 'package:code_exp/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../myUser.dart';

// User home is the default page when user is logged in. Activities all starts here

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    fitnessCalculator(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  String appBarTitle = "Home";
  @override
  Widget build(BuildContext context) {
    if (selectedIndex == 0) {
      setState(() {
        appBarTitle = "Home";
      });
    } else if (selectedIndex == 1) {
      setState(() {
        appBarTitle = "IPPT Fitness Calculator";
      });
    } else if (selectedIndex == 2) {
      setState(() {
        appBarTitle = "Profile";
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF4d7753),
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center), label: 'IPPT Calculator'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile')
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Color(0XFF4d7753),
          onTap: _onItemTapped),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  void selectCategory() {
    Navigator.of(context).pushNamed('/eCanteen-screen');
  }

  @override
  void initState() {
    firedb.getUserInfo(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double boxDim = MediaQuery.of(context).size.width / 2.4;
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Good Evening ${Provider.of<myUser>(context).name}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              SizedBox(height: 10),
              //IPPTEz System
              InkWell(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: const AssetImage('assets/images/ippt.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.darken),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'IPPTEz System',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/FITplan');
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text('Features',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              SizedBox(height: 15),
              //Features
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Reservist Maid
                  InkWell(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: boxDim,
                          width: boxDim,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/400yahoo_nsman.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.darken),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Reservist \nMaid',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/eChecklist-screen');
                    },
                  ),
                  SizedBox(width: 10),
                  //eCanteen
                  InkWell(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: boxDim,
                          width: boxDim,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/Special-sauces_1.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.darken),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'eCanteen Pal',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/eCanteen-screen');
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
