// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

Widget MyAppBar() {
  return AppBar(
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Flutter",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        Text(
          "News",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  const NewsTile(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.desc,
      required this.content,
      required this.posturl});

//  NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                    )));
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      imgUrl,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  desc,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                )
              ],
            ),
          )),
    );
  }
}
