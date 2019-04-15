import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 220,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=07b813c7144c510fb1c4e41a50582528/b8389b504fc2d56205c91de2e91190ef77c66cf8.jpg"),
              fit: BoxFit.cover,
//            repeat: ImageRepeat.repeat,
              alignment: Alignment.topLeft,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightBlue,
//                    borderRadius: BorderRadius.all(Radius.circular(6)),
                      gradient: LinearGradient(colors: [
                        Colors.deepOrange,
                        Colors.orangeAccent,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 16),
                            blurRadius: 25,
                            spreadRadius: -10),
                        BoxShadow(
                            color: Colors.lightBlue[100],
                            offset: Offset(0, 16),
                            blurRadius: 25,
                            spreadRadius: -10)
                      ]),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(8),
                  height: 90,
                  width: 90,
                  child: Icon(Icons.pool, size: 40, color: Colors.white)),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "假设你已经掌握了flutter的一些基础知识，比如环境搭建，简单的dart语法，及flutter组件化思想。那么你适合阅读本篇教程，本教程演示一些flutter中的flex用法的简单示例.",
          style: TextStyle(
              letterSpacing: 1.2,
              color: Colors.red,
              fontSize: 16,
              decoration: TextDecoration.underline),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 16,
        ),
        RichText(
            text: TextSpan(
                text: "good",
                style: TextStyle(color: Colors.cyan, fontSize: 20.9),
                children: [
              TextSpan(
                text: ",boy",
                style: TextStyle(color: Colors.purple, fontSize: 14),
              )
            ])),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
