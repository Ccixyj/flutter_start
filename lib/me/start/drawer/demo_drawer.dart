import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("xuyujam"),
            accountEmail: Text("123.123@123.email"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars1.githubusercontent.com/u/6183506?s=460&v=4"),
            ),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.orangeAccent[100].withOpacity(0.6),
                        BlendMode.hardLight),
                    image: NetworkImage(
                        "https://static.oschina.net/uploads/space/2019/0331/225739_MZSL_2720166.jpg"))),
          ),
          ListTile(
            leading: Icon(
              Icons.navigation,
              color: Colors.black26,
            ),
            title: Text("navigator"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/navigate");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.format_align_center,
              color: Colors.black26,
            ),
            title: Text("form"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/form");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.store_mall_directory,
              color: Colors.black26,
            ),
            title: Text("material components"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/mdc");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black26,
            ),
            title: Text("state"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/state");
            },
          )
        ],
      ),
    );
  }
}
