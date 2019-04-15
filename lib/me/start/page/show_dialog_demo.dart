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
          InkWell(
            child: Text("AlertDialog"),
            onTap: () {
              _showDialog(context, (c) => _buildAlterDialog(c));
            },
          ),
          InkWell(
            child: Text("Bottom Sheet"),
            onTap: () {
              _sKey.currentState.showBottomSheet(_buildBottomSheet);
            },
          ),
          InkWell(
            child: Text("Modal Bottom Sheet"),
            onTap: () {
              debugPrint("context ${_sKey.currentContext}");
              showModalBottomSheet(
                context: _sKey.currentContext,
                builder: (c) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: opts.entries
                          .toList()
                          .map((e) => _buildSimpleOption(c, e))
                          .toList(),
                    ),
              );
            },
          ),
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
    debugPrint("_showSimpleDialog context $context ${context.owner}");
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
}
