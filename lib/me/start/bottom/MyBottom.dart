import 'package:flutter/material.dart';

class MyBottom extends StatefulWidget {
  @override
  State createState() => _MyBottomState();
}

class _MyBottomState extends State<MyBottom> {
  var _index = 0;

  void _clickHandler(int value) {
    _index = value;
    setState(() {
      _index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _index,
        onTap: _clickHandler,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), title: Text("explore")),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text("history")),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_see), title: Text("local_see")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("person")),
        ]);
  }
}
