import 'package:flutter/material.dart';
import 'package:flutter_start/me/start/page/popup_menu_demo.dart';

import 'package:flutter_start/me/start/page/show_dialog_demo.dart';

import 'button_demo.dart';
import 'checkbox_demo.dart';
import 'date_time_demo.dart';
import 'floating_action_button_demo.dart';

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
            ListItem(
              title: "DatetimeDemo",
              page: DateTimeDemo(),
            ),
            ListItem(
              title: "showDialogDemo",
              page: ShowDialogDemo(),
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
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
    );
  }
}
