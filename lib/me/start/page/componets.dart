import 'package:flutter/material.dart';

class ComponentsDemo extends StatelessWidget {
  final _sKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      appBar: AppBar(
        title: Text("ComponentsDemo"),
      ),
      body: ListView(
        children: <Widget>[
          _buildChipDemo(),
          Divider(
            height: 2,
          )
        ],
      ),
    );
  }

  Widget _buildChipDemo() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        Chip(label: Text("Monday")),
        Chip(
          label: Text("Monday"),
          backgroundColor: Colors.cyanAccent,
        ),
        Chip(
          avatar: CircleAvatar(
            child: Text("A"),
            backgroundColor: Colors.grey,
          ),
          label: Text("Monday"),
          backgroundColor: Colors.cyanAccent,
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://avatars1.githubusercontent.com/u/6183506?s=460&v=4"),
            backgroundColor: Colors.grey,
          ),
          label: Text("Monday"),
          backgroundColor: Colors.orange,
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://avatars1.githubusercontent.com/u/6183506?s=460&v=4"),
            backgroundColor: Colors.grey,
          ),
          label: Text("Firday"),
          deleteIconColor: Colors.black54,
          onDeleted: () {
            debugPrint("delete");
          },
        ),
      ],
    );
  }
}
