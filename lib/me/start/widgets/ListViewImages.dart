import 'package:flutter/material.dart';
import 'package:flutter_start/me/start/model.dart';

class ListViewImages extends StatefulWidget {
  @override
  _ListViewImagesState createState() => _ListViewImagesState();
}

class _ListViewImagesState extends State<ListViewImages> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: Posts.length,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final post = Posts[index];
    return Container(
      margin: EdgeInsets.all(8),
      child: Material(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shadowColor: Colors.orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(
                  post.imageUrl,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  post.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(post.author,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w300)),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.orange.withOpacity(0.2),
                  highlightColor: Colors.orange.withOpacity(0.1),
                  onTap: () => {debugPrint("Tap")},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
