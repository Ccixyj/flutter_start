import 'package:flutter/material.dart';
import 'package:flutter_start/me/start/page/FormDemo.dart';
import 'package:flutter_start/me/start/page/Home.dart';
import 'package:flutter_start/me/start/page/MDC_Demo.dart';
import 'package:flutter_start/me/start/page/NavigatorDemo.dart';

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
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Color.fromRGBO(255, 255, 255, 0.3)),
      routes: {
        "/": (c) => Home(),
        "/about": (c) => PageFor("about"),
        "/navigate": (c) => NavigatorDemo(),
        "/form": (c) => FormDemo(),
        "/mdc": (c) => MDCDemo(),
              },
              initialRoute: "/",
        //      home: SliverDemo(),
            );
          }
        }
        

