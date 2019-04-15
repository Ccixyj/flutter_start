import 'dart:math';

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

    final nextInt = Random.secure().nextInt(10);
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButtonDemo"),
      ),
      body: Text("btn"),
      floatingActionButton:
          nextInt > 5 ? floatingActionButton1 : floatingActionButton2,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: nextInt > 5
          ? BottomAppBar(
              child: BottomNavigationBar(
                backgroundColor: Colors.deepOrangeAccent,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    title: Text("add"),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.delete),
                    title: Text("delete"),
                  )
                ],
              ),
              shape: CircularNotchedRectangle(),
            ) // BottomAppBar(
//              child: Container(
//                height: 80,
//                color: Colors.purple,
//                child: Center(child: Text("bottom app bar")),
//              ),
//              shape: CircularNotchedRectangle(),
//            )
          : null,
      bottomSheet: nextInt > 5
          ? null
          : BottomSheet(
              onClosing: () {},
              builder: (c) => Container(
                    height: 80,
                    color: Colors.indigo,
                    child: Center(child: Text("bottom sheet")),
                  )),
    );
  }

  void _pressed() {
    debugPrint("on pressed!");
  }
}
