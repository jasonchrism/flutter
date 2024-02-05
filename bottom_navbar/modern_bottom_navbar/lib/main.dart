import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moder Bottom Navbar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modern Navbar", style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
        backgroundColor: Colors.blue.shade500),
      bottomNavigationBar: Container(
        color: Colors.blue.shade500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Container(
            child: GNav(
                backgroundColor: Colors.blue.shade500,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.blue.shade300,
                padding: EdgeInsets.all(16),
                gap: 8,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.favorite_border,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: Icons.notifications,
                    text: 'Notification',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
