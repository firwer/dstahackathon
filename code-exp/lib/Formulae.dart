// This function returns the age group of the user
int getAgeGroup(age) {
  int ageGroup = 0;

  if (age < 22) {
    ageGroup = 1;
  } else if (age < 25) {
    ageGroup = 2;
  } else if (age < 28) {
    ageGroup = 3;
  } else if (age < 31) {
    ageGroup = 4;
  } else if (age < 34) {
    ageGroup = 5;
  } else if (age < 37) {
    ageGroup = 6;
  } else if (age < 40) {
    ageGroup = 7;
  } else if (age < 43) {
    ageGroup = 8;
  } else if (age < 46) {
    ageGroup = 9;
  } else if (age < 49) {
    ageGroup = 10;
  } else if (age < 52) {
    ageGroup = 11;
  } else if (age < 55) {
    ageGroup = 12;
  } else if (age < 58) {
    ageGroup = 13;
  } else if (age <= 60) {
    ageGroup = 14;
  }

  return ageGroup;
}

//formula for the maximum points for each age group
//type 1 refers to pushups, type 2 refers to situps
int getBest(int ageGroup, int type) {
  var bestRep = 0;

  switch (type) {
    case 1:
      if (ageGroup < 9) {
        bestRep = (60 - (ageGroup - 1));
      } else if (ageGroup < 13) {
        bestRep = (60 - 9 - ((ageGroup - 9) * 2));
      } else if (ageGroup == 13) {
        bestRep = 42;
      } else if (ageGroup == 14) {
        bestRep = 40;
      }
      break;
    case 2:
      if (ageGroup < 9) {
        bestRep = (60 - (ageGroup - 1));
      } else if (ageGroup < 11) {
        bestRep = (60 - 9 - ((ageGroup - 9) * 2));
      } else if (ageGroup == 11) {
        bestRep = 48;
      } else if (ageGroup <= 14) {
        bestRep = (60 - 14 - ((ageGroup - 12) * 2));
      }
      break;
  }

  return bestRep;
}

//returns the number of points from pushups based on number of pushups and age
int pointsForPushUps(age, int numOfPushUps) {
  int ageGroup = getAgeGroup(age);

  //standard formula for the least points for each age group
  int worst = 16 - ageGroup;

  int best = getBest(ageGroup, 1);

  //standard formula for points under 20
  if (numOfPushUps <= worst) {
    return 0;
  } else if (numOfPushUps == worst + 1) {
    return 1;
  } else if (numOfPushUps <= worst + 2) {
    return 2;
  } else if (numOfPushUps <= worst + 3) {
    return 4;
  } else if (numOfPushUps <= worst + 4) {
    return 6;
  } else if (numOfPushUps <= worst + 5) {
    return 8;
  } else if (numOfPushUps <= worst + 6) {
    return 9;
  } else if (numOfPushUps <= worst + 7) {
    return 10;
  } else if (numOfPushUps <= worst + 8) {
    return 11;
  } else if (numOfPushUps <= worst + 9) {
    return 12;
  } else if (numOfPushUps <= worst + 10) {
    return 13;
  } else if (numOfPushUps <= worst + 11) {
    return 14;
  } else if (numOfPushUps <= worst + 13) {
    return 15;
  } else if (numOfPushUps <= worst + 16) {
    return 16;
  } else if (numOfPushUps <= worst + 19) {
    return 17;
  } else if (numOfPushUps <= worst + 22) {
    return 18;
  } else if (numOfPushUps <= worst + 25) {
    return 19;
  }

  //formula for 20 to 23 points for age group below 9
  if (ageGroup < 9) {
    if (numOfPushUps <= best - 17) {
      return 20;
    } else if (numOfPushUps <= best - 13) {
      return 21;
    } else if (numOfPushUps <= best - 9) {
      return 22;
    } else if (numOfPushUps <= best - 5) {
      return 23;
    }
  }

  //for the rest of the age groups where there is no standard formula
  switch (ageGroup) {
    case 9:
      if (numOfPushUps <= 34) {
        return 20;
      } else if (numOfPushUps <= 38) {
        return 21;
      } else if (numOfPushUps <= 42) {
        return 22;
      } else if (numOfPushUps <= 46) {
        return 23;
      }
      break;
    case 10:
      if (numOfPushUps <= 33) {
        return 20;
      } else if (numOfPushUps <= 36) {
        return 21;
      } else if (numOfPushUps <= 40) {
        return 22;
      } else if (numOfPushUps <= 44) {
        return 23;
      }
      break;
    case 11:
      if (numOfPushUps <= 32) {
        return 20;
      } else if (numOfPushUps <= 35) {
        return 21;
      } else if (numOfPushUps <= 38) {
        return 22;
      } else if (numOfPushUps <= 42) {
        return 23;
      }
      break;
    case 12:
      if (numOfPushUps <= 31) {
        return 20;
      } else if (numOfPushUps <= 34) {
        return 21;
      } else if (numOfPushUps <= 37) {
        return 22;
      } else if (numOfPushUps <= 40) {
        return 23;
      }
      break;
    case 13:
      if (numOfPushUps <= 29) {
        return 20;
      } else if (numOfPushUps <= 32) {
        return 21;
      } else if (numOfPushUps <= 35) {
        return 22;
      } else if (numOfPushUps <= 38) {
        return 23;
      }
      break;
    case 14:
      if (numOfPushUps <= 28) {
        return 20;
      } else if (numOfPushUps <= 30) {
        return 21;
      } else if (numOfPushUps <= 33) {
        return 22;
      } else if (numOfPushUps <= 36) {
        return 23;
      }
      break;
  }

  //finally, last two cases, best score and second best
  if (numOfPushUps <= best - 1) {
    return 24;
  } else if (numOfPushUps >= best) {
    return 25;
  }

  return 0;
}

//returns number of points from situps based on number of situps and age
int pointsforSitUps(age, numofSitUps) {
  int ageGroup = getAgeGroup(age);

  //standard formula for the least points for each age group
  int worst = 16 - ageGroup;

  int best = getBest(ageGroup, 2);

  //standard formula for points under 20
  if (numofSitUps <= worst) {
    return 0;
  } else if (numofSitUps == worst + 1) {
    return 1;
  } else if (numofSitUps <= worst + 2) {
    return 2;
  } else if (numofSitUps <= worst + 3) {
    return 4;
  } else if (numofSitUps <= worst + 4) {
    return 6;
  } else if (numofSitUps <= worst + 5) {
    return 8;
  } else if (numofSitUps <= worst + 6) {
    return 9;
  } else if (numofSitUps <= worst + 7) {
    return 10;
  } else if (numofSitUps <= worst + 8) {
    return 11;
  } else if (numofSitUps <= worst + 9) {
    return 12;
  } else if (numofSitUps <= worst + 10) {
    return 13;
  } else if (numofSitUps <= worst + 11) {
    return 14;
  } else if (numofSitUps <= worst + 13) {
    return 15;
  } else if (numofSitUps <= worst + 16) {
    return 16;
  } else if (numofSitUps <= worst + 19) {
    return 17;
  } else if (numofSitUps <= worst + 22) {
    return 18;
  } else if (numofSitUps <= worst + 25) {
    return 19;
  }

  //formula for 20 to 23 points for age group below 9
  if (ageGroup < 9) {
    if (numofSitUps <= best - 17) {
      return 20;
    } else if (numofSitUps <= best - 13) {
      return 21;
    } else if (numofSitUps <= best - 9) {
      return 22;
    } else if (numofSitUps <= best - 5) {
      return 23;
    }
  }

  //for the rest of the age groups where there is no standard formula
  switch (ageGroup) {
    case 9:
      if (numofSitUps <= 34) {
        return 20;
      } else if (numofSitUps <= 38) {
        return 21;
      } else if (numofSitUps <= 42) {
        return 22;
      } else if (numofSitUps <= 46) {
        return 23;
      }
      break;
    case 10:
      if (numofSitUps <= 33) {
        return 20;
      } else if (numofSitUps <= 36) {
        return 21;
      } else if (numofSitUps <= 40) {
        return 22;
      } else if (numofSitUps <= 44) {
        return 23;
      }
      break;
    case 11:
      if (numofSitUps <= 32) {
        return 20;
      } else if (numofSitUps <= 35) {
        return 21;
      } else if (numofSitUps <= 39) {
        return 22;
      } else if (numofSitUps <= 43) {
        return 23;
      }
      break;
    case 12:
      if (numofSitUps <= 31) {
        return 20;
      } else if (numofSitUps <= 34) {
        return 21;
      } else if (numofSitUps <= 37) {
        return 22;
      } else if (numofSitUps <= 41) {
        return 23;
      }
      break;
    case 13:
      if (numofSitUps <= 30) {
        return 20;
      } else if (numofSitUps <= 33) {
        return 21;
      } else if (numofSitUps <= 36) {
        return 22;
      } else if (numofSitUps <= 39) {
        return 23;
      }
      break;
    case 14:
      if (numofSitUps <= 29) {
        return 20;
      } else if (numofSitUps <= 32) {
        return 21;
      } else if (numofSitUps <= 35) {
        return 22;
      } else if (numofSitUps <= 38) {
        return 23;
      }
      break;
  }

  //finally, last two cases, best score and second best
  if (numofSitUps <= best - 1) {
    return 24;
  } else if (numofSitUps >= best) {
    return 25;
  }

  return 0;
}

//List of the worst run time to obtain points for 2.4km run
List<String> worstRun = [
  "16:00",
  "16:10",
  "16:20",
  "16:40",
  "16:50",
  "17:00",
  "17:10",
  "17:20",
  "17:30",
  "17:40",
  "17:50",
  "18:00",
  "18:10",
  "18:20"
];

//List of the minimum run times to obtain maximum points for 2.4km run
List<String> bestRun = [
  "08:30",
  "08:40",
  "08:50",
  "09:10",
  "09:20",
  "09:30",
  "09:40",
  "09:50",
  "10:00",
  "10:10",
  "10:20",
  "10:30",
  "10:40",
  "10:50"
];

//list of possible scores
List<int> scoreList = [
  50,
  49,
  48,
  47,
  46,
  45,
  44,
  43,
  42,
  41,
  40,
  39,
  38,
  38,
  37,
  37,
  36,
  36,
  35,
  35,
  34,
  33,
  32,
  31,
  30,
  29,
  28,
  27,
  26,
  25,
  24,
  23,
  22,
  21,
  20,
  19,
  18,
  16,
  14,
  12,
  10,
  8,
  6,
  4,
  2,
  1
];

//returns points from 2.4km run based on timing and age
int pointsforRun(age, time) {
  int ageGroup = getAgeGroup(age);

  String worst = worstRun[ageGroup - 1];
  String best = bestRun[ageGroup - 1];
  int scoreIndex = 0;

  int getMin(runTime) => int.parse(runTime.substring(0, 2));
  int getSec(runTime) => int.parse(runTime.substring(3, 4));

  int convertTimetoNum(String time) =>
      int.parse(time.replaceAll(RegExp(':'), ''));

  int worstNum = convertTimetoNum(worst);
  int bestNum = convertTimetoNum(best);
  int runTimeNum = convertTimetoNum(time);

  if (runTimeNum == worstNum) {
    return scoreList.last;
  } else if (runTimeNum > worstNum) {
    return 0;
  } else if (runTimeNum <= bestNum) {
    return scoreList.first;
  } else {
    int minDiff = getMin(time) - getMin(best);
    int secDiff = getSec(time) - getSec(best);

    scoreIndex += minDiff * 6 + secDiff;
  }

  return scoreList[scoreIndex];
}

//total timings
List<String> timings = [
  "18:50",
  "18:40",
  "18:30",
  "18:20",
  "18:10",
  "18:00",
  "17:50",
  "17:40",
  "17:30",
  "17:20",
  "17:10",
  "17:00",
  "16:50",
  "16:40",
  "16:30",
  "16:20",
  "16:10",
  "16:00",
  "15:50",
  "15:40",
  "15:30",
  "15:20",
  "15:10",
  "15:00",
  "14:50",
  "14:40",
  "14:30",
  "14:20",
  "14:10",
  "14:00",
  "13:50",
  "13:40",
  "13:30",
  "13:20",
  "13:10",
  "13:00",
  "12:50",
  "12:40",
  "12:30",
  "12:20",
  "12:10",
  "12:00",
  "11:50",
  "11:40",
  "11:30",
  "11:20",
  "11:10",
  "11:00",
  "10:50",
  "10:40",
  "10:30",
  "10:20",
  "10:10",
  "10:00",
  "09:50",
  "09:40",
  "09:30",
  "09:20",
  "09:10",
  "09:00",
  "08:50",
  "08:40",
  "08:30"
];

//BMI Calculator
String calculateBMI(height, weight) {
  double mHeight = height / 100;
  return (weight / (mHeight * mHeight)).toStringAsFixed(2);
}
