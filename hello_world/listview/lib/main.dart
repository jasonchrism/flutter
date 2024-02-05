import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Post {
  late String body;
  late String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    this.userLiked = !this.userLiked;
    if (this.userLiked) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "Jason"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Post It!'), backgroundColor: Colors.orange),
        body: Column(
          children: <Widget>[
            Expanded(child: PostList(this.posts)),
            TextInputWidget(this.newPost)
          ],
        ));
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  TextInputWidget(this.callback);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message..",
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.blue,
              color: Colors.orange,
              tooltip: "Send a message",
              onPressed: this.click,
            )));
  }
}

class PostList extends StatefulWidget {
  late final List<Post> listItems;

  PostList(this.listItems);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
                child: ListTile(
                    title: Text(post.body),
                    subtitle: Text(post.author))),
            Row(children: <Widget>[
              Container(
                  child: Text(post.likes.toString(),
                      style: TextStyle(fontSize: 20)),
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () => this.like(post.likePost),
                color: post.userLiked ? Colors.green : Colors.black,
              )
            ])
          ]),
        );
      },
    );
  }
}
