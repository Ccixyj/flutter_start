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

  @override
  Widget build(BuildContext context) {
    var row1 = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: _selected,
          onChanged: _onchange,
          activeColor: Colors.greenAccent,
        ),
        Text("select $_selected"),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("CheckboxDemo"),
      ),
      body: Column(
        children: <Widget>[
          row1,
          CheckboxListTile(
            activeColor: Colors.blueAccent,
            value: _selected,
            onChanged: _onchange,
            title: Text("Select box tile"),
            subtitle: Text("value $_selected"),
            secondary: Icon(Icons.sentiment_very_satisfied),
            dense: true,
            controlAffinity: ListTileControlAffinity.platform,
          ),
        ],
      ),
    );
  }

  void _onchange(value) {
    setState(() {
      this._selected = value;
    });
  }
}
