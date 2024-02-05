import 'package:flutter/material.dart';
import 'package:page_navigation/myHomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Good Morning!'),
            backgroundColor: const Color.fromARGB(255, 211, 120, 227)),
        body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String name;
  TextEditingController controller = new TextEditingController();

  void click() {
    this.setState(() {
      this.name = controller.text;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => myHomePage(this.name)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
                controller: this.controller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Type Your Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5, color: Colors.black)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send_rounded,
                        color: const Color.fromARGB(255, 232, 145, 247),
                      ),
                      splashColor: Colors.blue,
                      color: Colors.blue,
                      tooltip: "Submit",
                      onPressed: this.click,
                    )))));
  }
}
