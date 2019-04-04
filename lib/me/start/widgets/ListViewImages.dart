import 'package:flutter/material.dart';

class ListViewImages extends StatefulWidget {
  @override
  _ListViewImagesState createState() => _ListViewImagesState();
}

class _ListViewImagesState extends State<ListViewImages> {
  final images = <Post>[
    Post("黑鲨", "陈粘",
        "https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a292f2e0af44ad3431bf8187e0a30c08/574e9258d109b3deaf33b465c2bf6c81800a4c2a.jpg"),
    Post("樱花", "云山虎影",
        "https://ss1.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=10da86d6df43ad4bb92e40c0b2035a89/03087bf40ad162d93b3a196f1fdfa9ec8b13cde9.jpg"),
    Post("背影", "云山虎影",
        "https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=7dac85b2825494ee982209191df4e0e1/c2cec3fdfc03924558fae5028994a4c27d1e256b.jpg"),
    Post("邻家女孩", "蹈岭南",
        "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=07b813c7144c510fb1c4e41a50582528/b8389b504fc2d56205c91de2e91190ef77c66cf8.jpg"),
    Post("劳动最光荣", "映山红摄影师",
        "https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=b450d860d354564efa65e23983de9cde/80cb39dbb6fd52662d12d867a518972bd407368c.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: images.length,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final post = images[index];
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      child: Column(
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
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
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
    );
  }
}

class Post {
  final String title;
  final String author;
  final String imageUrl;

  const Post(this.title, this.author, this.imageUrl);
}
