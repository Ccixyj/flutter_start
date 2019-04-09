import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButtonDemo"),
      ),
      body: Text("btn"),
      floatingActionButton: FloatingActionButton(
        tooltip: "float button",
        child: Icon(
          Icons.toys,
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(8)),
        onPressed: _pressed,
      ),
    );
  }

  void _pressed() {
    debugPrint("on pressed!");
  }
}
