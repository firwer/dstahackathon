import 'package:flutter/material.dart';

int totalScore(pushup, situp, run) {
  return pushup + situp + run;
}

String result(int totalPoints) {
  if (totalPoints < 51) {
    return "Fail";
  } else if (totalPoints < 61) {
    return "Pass";
  } else if (totalPoints < 75) {
    return "Pass with incentive";
  } else if (totalPoints < 85) {
    return "Silver";
  } else {
    return "Gold";
  }
}

int planFreq(String results) {
  if (results == 'Gold') {
    return 6;
  } else if (results == 'Silver') {
    return 5;
  } else if (results == 'Pass' || results == 'Pass with incentive') {
    return 4;
  } else {
    return 3;
  }
}

colorChange(String results) {
  if (results == 'Gold') {
    return Color.fromARGB(255, 230, 178, 20);
  } else if (results == 'Silver') {
    return Color.fromARGB(255, 117, 127, 133);
  } else if (results == 'Pass' || results == 'Pass with incentive') {
    return Color.fromARGB(255, 72, 62, 33);
  } else {
    return Color.fromARGB(255, 61, 13, 13);
  }
}
