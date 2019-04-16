import 'package:flutter/material.dart';

class ShowDialogDemo extends StatelessWidget {
  final _sKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      appBar: AppBar(
        title: Text("ShowDialogDemo"),
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            child: Text("SimpleDialog"),
            onTap: () {
              _showDialog(context, (c) => _buildSimpleDialog(c));
            },
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            child: Text("AlertDialog"),
            onTap: () {
              _showDialog(context, (c) => _buildAlterDialog(c));
            },
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            child: Text("Bottom Sheet"),
            onTap: () {
              _sKey.currentState.showBottomSheet(_buildBottomSheet);
            },
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            child: Text("Modal Bottom Sheet"),
            onTap: () {
              _showBottomSheetModal(_sKey.currentContext);
            },
          ),
          SizedBox(
            height: 16,
          ),
          _buildExpansionPanel(),
          SizedBox(
            height: 16,
          ),
//          ExpansionPanelDemo(),
        ],
      ),
    );
  }

  final opts = {
    "A": "Option A",
    "B": "Option B",
    "C": "Option C",
  };

  static Widget _buildSimpleOption(BuildContext c, MapEntry<String, String> e) {
    return SimpleDialogOption(
      child: ListTile(
        leading: Icon(Icons.backup),
        title: Text(e.value),
        dense: true,
      ),
      onPressed: () {
        debugPrint("onPressed");
        Navigator.pop(c, {"result": e.key});
      },
    );
  }

  _showDialog(BuildContext context, WidgetBuilder builderDialog) async {
    final res = await showDialog(context: context, builder: builderDialog);

    debugPrint("await dialog result => $res");
    if (res != null) {
      _sKey.currentState.hideCurrentSnackBar();
      _sKey.currentState.showSnackBar(SnackBar(
        content: Text("Your choice is : $res"),
        duration: Duration(seconds: 1),
      ));
    }
  }

  /* dialogs */
  Widget _buildSimpleDialog(BuildContext c) {
    final optWidgets =
        opts.entries.toList().map((e) => _buildSimpleOption(c, e)).toList();

    return SimpleDialog(
      title: Text("SimpleDialog"),
      children: optWidgets,
    );
  }

  Widget _buildAlterDialog(BuildContext c) {
    final optWidgets = opts.entries
        .toList()
        .map((e) => FlatButton(
              child: Text(e.value),
              onPressed: () {
                Navigator.pop(c, e.key);
              },
            ))
        .toList();
    return AlertDialog(
      content: Text("AlertDialog Content"),
      title: Text("AlertDialog"),
      actions: optWidgets,
    );
  }

  Widget _buildBottomSheet(BuildContext c) {
    final optWidgets =
        opts.entries.toList().map((e) => _buildSimpleOption(c, e)).toList();
//    return BottomSheet(onClosing: () {
//      debugPrint("bottom sheet close");
//    }, builder: (c) {
//      return ConstrainedBox(
//        constraints: BoxConstraints.loose(Size(double.infinity, 200)),
//        child: Column(
//          children: optWidgets,
//        ),
//      );
//    });

    return BottomAppBar(
      color: Colors.cyanAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: optWidgets,
      ),
    );
  }

  _showBottomSheetModal(BuildContext c) async {
    final f = await showModalBottomSheet(
      context: c,
      builder: (c) => Column(
            mainAxisSize: MainAxisSize.min,
            children: opts.entries
                .toList()
                .map((e) => _buildSimpleOption(c, e))
                .toList(),
          ),
    );

    debugPrint("result $f");
  }

  Widget _buildExpansionPanel() {
    bool showBody = true;
    return StatefulBuilder(builder: (c, fn) {
//      debugPrint("StatefulBuilder $c , $fn");
//      bool showBody = true;  此处无效！！！
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ExpansionPanelList(
          expansionCallback: (index, ex) {
            fn(() {
              debugPrint("get expansion $showBody");
              showBody = !ex;
              debugPrint("set expansion $showBody");
            });
          },
          children: [
            ExpansionPanel(
                isExpanded: showBody,
                headerBuilder: (c, ex) {
                  debugPrint("ExpansionPanel $ex");
                  return Text("head _buildExpansionPanel");
                },
                body: GestureDetector(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("body"),
                    ),
                  ),
                  onTap: () {},
                )),
          ],
        ),
      );
    });
  }
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  State createState() {
    return ExpansionPanelState();
  }
}

class ExpansionPanelState extends State<ExpansionPanelDemo> {
  final _data = generateItems(3);

  Item get firstItem => _data.first;

  bool showBody = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionPanelList(
        expansionCallback: (index, ex) {
//          fn(() {
//            debugPrint("get expansion $showBody");
//            showBody = !ex;
//            debugPrint("set expansion $showBody");
//          });
          setState(() {
            debugPrint("get expansion $showBody");
            showBody = !ex;
            debugPrint("set expansion $showBody");
          });
        },
        children: [
          ExpansionPanel(
              isExpanded: showBody,
              headerBuilder: (c, ex) {
                debugPrint("ExpansionPanel $ex");
                return Text("head ExpansionPanelDemo");
              },
              body: GestureDetector(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("body"),
                  ),
                ),
                onTap: () {},
              )),
        ],
      ),
    );

//    return ExpansionPanelList(
//      expansionCallback: (int index, bool isExpanded) {
//        setState(() {
//          _data[index].isExpanded = !isExpanded;
//        });
//      },
//      children: _data.map<ExpansionPanel>((Item item) {
//        return ExpansionPanel(
//          headerBuilder: (BuildContext context, bool isExpanded) {
//            return ListTile(
//              title: Text(item.headerValue),
//            );
//          },
//          body: ListTile(
//              title: Text(item.expandedValue),
//              subtitle: Text('To delete this panel, tap the trash can icon'),
//              trailing: Icon(Icons.delete),
//              onTap: () {
//                setState(() {
//                  _data.removeWhere((currentItem) => item == currentItem);
//                });
//              }),
//          isExpanded: item.isExpanded,
//        );
//      }).toList(),
//    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;

  @override
  String toString() {
    return 'Item{expandedValue: $expandedValue, headerValue: $headerValue, isExpanded: $isExpanded}';
  }
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
