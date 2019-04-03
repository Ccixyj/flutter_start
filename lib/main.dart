import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 12),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars1.githubusercontent.com/u/6183506?s=460&v=4"),
              ),
            ),
            Text("Flutter start")
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: Border.all(
                  color: Colors.red,
                  width: 8.0,
                ) +
                Border.all(
                  color: Colors.green,
                  width: 8.0,
                ) +
                Border.all(
                  color: Colors.blue,
                  width: 8.0,
                ),
          ),
          child: const Text('RGB', textAlign: TextAlign.center)),
    );
  }
}
