import 'package:flutter/material.dart';
import 'package:flutter_start/me/start/page/FloatingActionButtonDemo.dart';

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




