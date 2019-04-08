import 'package:flutter/material.dart';
import 'package:flutter_start/me/start/bottom/MyBottom.dart';
import 'package:flutter_start/me/start/drawer/MyDrawer.dart';
import 'package:flutter_start/me/start/widgets/BasicDemo.dart';
import 'package:flutter_start/me/start/widgets/LayoutDemo.dart';
import 'package:flutter_start/me/start/widgets/ListViewImages.dart';
import 'package:flutter_start/me/start/widgets/SliverDemo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => {
                  debugPrint("menu is pressed"),
                  scaffoldKey.currentState.openDrawer()
                },
            tooltip: "menu",
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Text("Flutter start"),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {debugPrint("search is pressed")},
              tooltip: "search",
            )
          ],
          bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.lightBlue,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.local_florist),
                ),
                Tab(
                  icon: Icon(Icons.change_history),
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                ),
                Tab(
                  icon: Icon(Icons.desktop_mac),
                ),
              ]),
          elevation: 0,
        ),
        backgroundColor: Colors.grey[100],
        body: TabBarView(children: <Widget>[
          ListViewImages(),
          BasicDemo(),
          LayoutDemo(),          SliverDemo(),        ]),
        drawer: MyDrawer(),
        endDrawer: Container(
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.white,
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("wold")],
            )),
        bottomNavigationBar: new MyBottom(),
      ),
    );
  }
}
