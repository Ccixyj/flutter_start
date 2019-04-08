import 'package:flutter/material.dart';
import 'package:flutter_start/me/start/model.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ScrollPhysics(),
//        scrollDirection: Axis.horizontal,
        slivers: <Widget>[
          SliverAppBar(
//            title: Text("Sliver"),
            pinned: true,
//            floating: true,
            expandedHeight: 178,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Sliver",
                style: TextStyle(
                    fontSize: 18, letterSpacing: 3, color: Colors.white),
              ),
              background: Image.network(
                Posts.last.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverSegmentation(
            title: Text("Sliver Grid"),
          ),
          SliverGridDemo(),
          SliverSegmentation(
            title: Text("Sliver List"),
          ),
          SliverListDemo(),
        ],
      ),
    );
  }
}

class SliverSegmentation extends StatelessWidget {
  final Text title;
  final Color color;

  const SliverSegmentation({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 8, right: 8),
      sliver: SliverToBoxAdapter(
        child: title == null
            ? Divider(color: color)
            : Row(
                children: <Widget>[
                  Expanded(child: Divider(color: color)),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: title,
                  ),
                  Expanded(
                      child: Divider(
                    color: color,
                  )),
                ],
              ),
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverPadding(
        padding: EdgeInsets.all(8),
        sliver: sliver,
      ),
    );
  }

  final sliver = SliverList(
      delegate:
          SliverChildBuilderDelegate(_buildItem, childCount: Posts.length));
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverPadding(
        padding: EdgeInsets.all(8),
        sliver: sliver,
      ),
    );
  }

  final sliver = SliverGrid(
    delegate: SliverChildBuilderDelegate(_buildItem, childCount: Posts.length),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  );

  final sliverCount = SliverGrid.count(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    children: c,
  );
}

final List<Widget> c = Posts.map(_buildItemWithPost).toList(growable: false);

Widget _buildItem(BuildContext c, int index) {
  final e = Posts[index];
  return _buildItemWithPost(e);
}

Widget _buildItemWithPost(Post e) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Material(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(12),
      color: Colors.black12.withOpacity(0.8),
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              e.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              left: 16,
              bottom: 32,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.black12.withOpacity(0.2),
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 4, bottom: 4),
                  child: Text(
                    e.title,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              )),
          Positioned(
              bottom: 4,
              left: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.black12.withOpacity(0.2),
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 4, bottom: 4),
                  child: Text(
                    e.author,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}
