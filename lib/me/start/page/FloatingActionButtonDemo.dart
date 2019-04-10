import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final floatingActionButton1 = FloatingActionButton(
      tooltip: "float button",
      child: Icon(
        Icons.toys,
        color: Colors.white,
      ),
      backgroundColor: Colors.cyan,
//      shape: BeveledRectangleBorder(
//          borderRadius: BorderRadiusDirectional.circular(8)),
      onPressed: _pressed,
    );

    final floatingActionButton2 = FloatingActionButton.extended(
      foregroundColor: Colors.white,
      icon: Icon(Icons.add),
      onPressed: _pressed,
      label: Text("添加"),

    );
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButtonDemo"),
      ),
      body: Text("btn"),
      floatingActionButton: floatingActionButton1,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          color: Colors.purple,
          child: Center(child: Text("bottom app bar")),
        ),
      shape: CircularNotchedRectangle(),
      ),
    );
  }

  void _pressed() {
    debugPrint("on pressed!");
  }
}
