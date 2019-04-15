import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconBadge(Icons.pool),
            IconBadge(
              Icons.face,
              size: 64,
            ),
            IconBadge(Icons.airplanemode_active),
            SizedBox(
              height: 32,
            ),
            new StackDemo(),
            SizedBox(
              height: 32,
            ),
            AspectRatioDemo(),
            SizedBox(
              height: 32,
            ),
            Row(children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.tight(Size(140, 100)),
                child: IconBadge(Icons.access_alarm),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.loose(Size(100, 150)),
                child: IconBadge(Icons.access_alarm),
              )
            ],),
          ],
        )
      ],
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 0.5,
      child: IconBadge(Icons.star),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          alignment: Alignment(-0.5, 0.2),
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(8)),
          child: null,
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient:
                  RadialGradient(colors: [Colors.grey[100], Colors.orange])),
          child: Icon(
            Icons.brightness_2,
            size: 48,
            color: Colors.white,
          ),
        ),
        Positioned(
            right: 10,
            top: 10,
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
            )),
        Positioned(
            right: 40,
            top: 60,
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
            )),
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 32,
      height: size + 32,
      color: Colors.lightBlue,
      child: Icon(
        icon,
        size: this.size,
        color: Colors.white,
      ),
    );
  }
}
