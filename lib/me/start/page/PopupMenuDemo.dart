import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopupMenuDemo extends StatefulWidget {
  @override
  State createState() {
    return _PopupMenuState();
  }
}

class _PopupMenuState extends State<PopupMenuDemo> {
  final menus = ["Home", "Discover", "Person"];
  var selected = "";

  @override
  void initState() {
    super.initState();
    this.selected = menus.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuDemo"),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: _buildMenu,
            initialValue: selected,
            icon: Icon(Icons.hd),
            onSelected: _selected,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text("you select menu : ${selected ?? "unknow"}"),
      ),
    );
  }

  List<PopupMenuEntry> _buildMenu(BuildContext context) {
    return menus
        .map((e) => PopupMenuItem(
              value: e,
              child: Text(e),
            ))
        .toList();
  }

  void _selected(value) {
    setState(() {
      this.selected = value;
    });
  }
}
