import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Flutter Exam 3",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SfHijriDateRangePicker(
          view: HijriDatePickerView.year,
        ),
      ),
    );
  }
}
