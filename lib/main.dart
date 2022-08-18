import 'page/profile_page.dart';
import 'page/home_page.dart';
import 'page/book_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //final navigationKey = GlobalKey<CurvedNavigationBarState>();

  final screen = [
    HomePage(),
    BookPage(),
    ProfilePage(),
  ];

  int index = 0;

  final items = <Widget>[
    const Icon(
      Icons.home,
      size: 30,
    ),
    const Icon(
      Icons.add,
      size: 30,
    ),
    const Icon(
      Icons.person,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('E-KALAKAL'),
        centerTitle: true,
      ),
      body: screen[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          //key: navigationKey,
          height: 60,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
          color: Colors.blue,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
