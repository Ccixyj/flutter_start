import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  State createState() {
    return _CheckboxState();
  }
}

class _CheckboxState extends State<CheckboxDemo> {
  var _selected = true;

  var groupA = 1;

  @override
  Widget build(BuildContext context) {
    var row1 = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: _selected,
          onChanged: _onBoolchange,
          activeColor: Colors.cyanAccent,
        ),
        Text("select $_selected"),
      ],
    );

    var row2 = Theme(
      data: Theme.of(context).copyWith(toggleableActiveColor: Colors.red),
//            data: ThemeData(
//              primarySwatch: Colors.green,
//            ),
      child: CheckboxListTile(
        value: _selected,
        onChanged: _onBoolchange,
        title: Text("Select box tile"),
        subtitle: Text("value $_selected"),
        secondary: Icon(Icons.sentiment_very_satisfied),
        dense: true,
        controlAffinity: ListTileControlAffinity.platform,
      ),
    );
    var row3 = Row(
      children: <Widget>[
        Radio(value: 0, groupValue: groupA, onChanged: _valueChange),
        Radio(value: 0, groupValue: groupA, onChanged: _valueChange),
        Radio(value: 1, groupValue: groupA, onChanged: _valueChange),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckboxDemo"),
      ),
      body: Column(
        children: <Widget>[
          row1,
          row2,
          row3,
          Switch(value: _selected, onChanged: _onBoolchange)
        ],
      ),
    );
  }

  void _onBoolchange(value) {
    setState(() {
      this._selected = value;
    });
  }

  void _valueChange(value) {
    debugPrint("value change $value");
    setState(() {
      groupA = value;
    });
  }
}
