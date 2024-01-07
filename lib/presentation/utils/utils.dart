import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  String calculateElapsedTime(String datePublication) {
    DateTime currentDate = DateTime.now();
    DateTime dateCreated =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(datePublication);

    Duration timeDifference = currentDate.difference(dateCreated);
    int seconds = timeDifference.inSeconds;
    int minutes = timeDifference.inMinutes;
    int hours = timeDifference.inHours;
    int days = timeDifference.inDays;

    if (days > 0) {
      return "Hace $days días";
    } else if (hours > 0) {
      return "Hace $hours horas";
    } else if (minutes > 0) {
      return "Hace $minutes minutos";
    } else {
      return "Hace $seconds segundos";
    }
  }

  Color colorState(int state, BuildContext context) {
    Map<int, Color> colorMap = {
      0: Colors.blue, 
      1: Colors.blue, 
      2: Colors.red, 
      3: Colors.red, 
      4: Colors.red, 
      5: Colors.green, 
      6: Colors.green, 
      7: Colors.green, 
      8: Colors.red, 
      9: Colors.red, 
      10: Colors.green, 
    };

    return colorMap[state] ??
        Colors.blue; 
  }
}
