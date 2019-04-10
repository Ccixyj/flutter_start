import 'package:flutter/material.dart';
import 'package:flutter_start/me/start/page/ButtonDemo.dart';
import 'package:flutter_start/me/start/page/CheckboxDemo.dart';
import 'package:flutter_start/me/start/page/FloatingActionButtonDemo.dart';
import 'package:flutter_start/me/start/page/PopupMenuDemo.dart';

class MDCDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MDCDemo"),
        ),
        body: ListView(
          children: <Widget>[
            ListItem(
              title: "FloationActionDemo",
              page: FloatingActionButtonDemo(),
            ),
            ListItem(
              title: "ButtomDemo",
              page: ButtonDemo(),
            ),
            ListItem(
              title: "PopupMenuDemo",
              page: PopupMenuDemo(),
            ),
            ListItem(
              title: "CheckboxDemo",
              page: CheckboxDemo(),
            ),
          ],
        ));
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title), 
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> page)) ,
    );
  }
}




