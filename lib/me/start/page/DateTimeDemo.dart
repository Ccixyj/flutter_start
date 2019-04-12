import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDemo extends StatefulWidget {
  @override
  State createState() => _DatetimeState();
}

class _DatetimeState extends State<DateTimeDemo> {
  var _selectDate = DateTime.now();
  final dateFormat = DateFormat("yyyy-MM-dd");
  final dateTimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  final sink = StreamController<DateTime>();

  @override
  void initState() {
    super.initState();
    sink.stream.listen((d) {
      debugPrint("listen :$d");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DateTimeDemo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: _selectDateHandler,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("date : ${dateFormat.format(_selectDate)}")
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: _selectDateTimeHandler,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("time : ${dateTimeFormat.format(_selectDate)}")
              ],
            ),
          )
        ],
      ),
    );
  }

  void _selectDateHandler() async {
    var f = await showDatePicker(
      context: context,
      initialDate: _selectDate,
      firstDate: _selectDate.subtract(Duration(days: 360 * 10)),
      lastDate: _selectDate.add(Duration(days: 360 * 10)),
    );
    sink.sink.add(f);
    setState(() {
      _selectDate = f;
      debugPrint("date :$_selectDate");
    });
  }

  void _selectDateTimeHandler() async {
    var f = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      debugPrint("time $f");
      _selectDate = DateTime(
        _selectDate.year,
        _selectDate.month,
        _selectDate.day,
        f.hour,
        f.minute,
      );
    });
  }
}
