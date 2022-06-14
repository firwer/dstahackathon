import 'package:code_exp/myUser.dart';
import 'package:code_exp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:code_exp/firedb.dart';
import 'package:provider/provider.dart';

// This page contains user data collection widgets for new sign ups
// Currently this page will collect: Age, Gender, Name, Height and Weight
//enum gender { male, female }

class newUserData extends StatefulWidget {
  const newUserData({Key? key}) : super(key: key);

  @override
  State<newUserData> createState() => _newUserDataState();
}

class _newUserDataState extends State<newUserData> {
  TextEditingController name = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  @override
  String? selectedGender = "male";
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF4d7753),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(children: [
          SizedBox(height: 40),
          Text(
            'Let\'s Get To Know You!',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 30),
          Icon(Icons.account_circle, size: 150, color: Colors.white),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Name:',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: userInput(
                      name, "Enter Your Name Here", TextInputType.name)),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          //Gender
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gender:',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Text(
                    'Male',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Radio<String>(
                    fillColor: MaterialStateProperty.all(Colors.white),
                    activeColor: Colors.white,
                    value: "male",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        print(selectedGender);
                        selectedGender = value;
                        print(selectedGender);
                      });
                    },
                  ),
                  Text(
                    'Female',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Radio<String>(
                    fillColor: MaterialStateProperty.all(Colors.white),
                    activeColor: Colors.white,
                    value: "female",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        print(selectedGender);
                        selectedGender = value;
                        print(selectedGender);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //Height
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Height (CM):',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: userInput(height, "Height",
                      TextInputType.numberWithOptions(decimal: false))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //Weight
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weight (KG):',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: userInput(weight, "Weight",
                      TextInputType.numberWithOptions(decimal: true))),
            ],
          ),
          SizedBox(height: 15),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: Text(
                'Let\'s Go',
                style: TextStyle(
                    color: Color(0XFF4d7753),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
            ),
            onTap: () {
              Provider.of<myUser>(context, listen: false).updateUserInfo(
                  name.text,
                  int.parse(height.text),
                  double.parse(weight.text),
                  selectedGender!);
              firedb.createUser(name.text, selectedGender!,
                  int.parse(height.text), double.parse(weight.text));
              Navigator.of(context).pushNamed('/userhome');
            },
          ),
        ]),
      ),
    );
  }
}
