import 'package:flutter/material.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';

class myHomePage extends StatefulWidget {
  late String name;

  myHomePage(this.name);

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Post It!'), backgroundColor: Colors.purple),
        body: Column(
          children: <Widget>[
            Expanded(child: PostList(this.posts)),
            TextInputWidget(this.newPost)
          ],
        ));
  }
}
