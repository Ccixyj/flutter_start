import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Navigator"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text("Home")),
              FlatButton(
                  onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext c) {
                        return PageFor("About");
                      })),
                  child: Text("About")),
            ],
          ),
        ));
  }
}

class PageFor extends StatelessWidget {
  final String title;

  PageFor(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
