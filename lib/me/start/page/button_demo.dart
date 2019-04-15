import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var row = new FlatButtonDemo();
    var row2 = new RaisedButtomDemo();
    var row3 = new OutLineButtonDemo();
    var row4 = new FixWidthDemo();
    var row5 = new ExpandedButtonDemo();
    var row6 = new ButtonBarDemo();
    return Theme(
      data: ThemeData(primarySwatch: Colors.purple),
      child: Scaffold(
        appBar: AppBar(
          title: Text("ButtonDemo"),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              row,
              SizedBox(
                height: 12,
              ),
              row2,
              SizedBox(
                height: 12,
              ),
              row3,
              SizedBox(
                height: 12,
              ),
              row4,
              SizedBox(
                height: 12,
              ),
              row5,
              SizedBox(
                height: 12,
              ),
              row6,
            ],
          ),
        ),
      ),
    );
  }
}

class RaisedButtomDemo extends StatelessWidget {
  const RaisedButtomDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
            onPressed: () {},
            child: Text("FlatButton"),
            textColor: Colors.cyan,
//                    shape: BeveledRectangleBorder(
//                      side:  BorderSide(width: 1 ,color: Colors.greenAccent),
//                      borderRadius: BorderRadius.circular(12)
//                    ),
//                      shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(12))
            shape: StadiumBorder()),
        SizedBox(
          width: 12,
        ),
        RaisedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("add "),
          textColor: Theme.of(context).accentColor,
          color: Colors.greenAccent.withOpacity(0.6),
          elevation: 0.0,
        )
      ],
    );
  }
}

class FlatButtonDemo extends StatelessWidget {
  const FlatButtonDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("FlatButton"),
          textColor: Colors.cyan,
        ),
        SizedBox(
          width: 12,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: ClipRRect(
            child: Text("add "),
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
          ),
          textColor: Colors.indigo,
          shape: Border(bottom: BorderSide(width: 2, color: Colors.indigo)),
        ),
      ],
    );
  }
}

class OutLineButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OutlineButton(
          borderSide: BorderSide(
              width: 1, style: BorderStyle.solid, color: Colors.grey[200]),
          onPressed: () {},
          child: Text("FlatButton"),
          textColor: Colors.cyan,
          highlightedBorderColor: Colors.grey[300],
        ),
        SizedBox(
          width: 12,
        ),
        OutlineButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: ClipRRect(
            child: Text("add "),
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
          ),
          textColor: Colors.indigo,
          shape: StadiumBorder(),
        ),
        SizedBox(
          width: 12,
        ),
      ],
    );
  }
}

class FixWidthDemo extends StatefulWidget {
  @override
  State createState() {
    return _FixWidthState();
  }
}

class _FixWidthState extends State<FixWidthDemo> {
  var value = 100.0;

  @override
  void didUpdateWidget(FixWidthDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget $oldWidget");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LayoutBuilder(
          builder: (c, b) {
            debugPrint("cons $b");

            return Slider(
              label: "value :${this.value.toInt()}",
              value: this.value,
              min: 10,
              max: b.biggest.width,
              divisions: 100,
              onChanged: _valueChanged,
            );
          },
        ),
        Row(
          children: <Widget>[
            Container(
              width: value,
              child: OutlineButton(
                borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Colors.grey[200]),
                onPressed: () {},
                child: Text(
                  "change width",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                textColor: Colors.cyan,
                highlightedBorderColor: Colors.grey[300],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _valueChanged(double value) {
    setState(() {
      this.value = value;
    });
  }
}

class ExpandedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            borderSide: BorderSide(
                width: 1, style: BorderStyle.solid, color: Colors.grey[200]),
            onPressed: () {},
            child: Text("FlatButton"),
            textColor: Colors.cyan,
            highlightedBorderColor: Colors.grey[300],
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: ClipRRect(
              child: Text("add "),
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAlias,
            ),
            textColor: Colors.indigo,
            shape: StadiumBorder(),
          ),
        ),
        SizedBox(
          width: 12,
        ),
      ],
    );
  }
}

class ButtonBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        //设置按钮主题间距
        buttonTheme: ButtonThemeData(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10)),
      ),
      child: ButtonBar(
        alignment: MainAxisAlignment.start,
        children: <Widget>[
          OutlineButton(
            borderSide: BorderSide(
                width: 1, style: BorderStyle.solid, color: Colors.grey[200]),
            onPressed: () {},
            child: Text("FlatButton"),
            textColor: Colors.cyan,
            highlightedBorderColor: Colors.grey[300],
          ),
          OutlineButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: ClipRRect(
              child: Text("add "),
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAlias,
            ),
            textColor: Colors.indigo,
            shape: StadiumBorder(),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
