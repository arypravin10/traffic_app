import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class date_time extends StatefulWidget {
  const date_time({ Key? key }) : super(key: key);

  @override
  State<date_time> createState() => _date_timeState();
}

class _date_timeState extends State<date_time> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM d EEEE         kk:mm:ss ').format(now);
    return Container(
      child: Center(
        child: Text(formattedDate,
            textAlign: TextAlign.center,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
      
    ));
  }
}


