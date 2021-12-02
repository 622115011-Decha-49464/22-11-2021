// ignore_for_file: prefer_const_constructors, dead_code, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:three/pages/calc.dart';
import 'package:three/pages/contact.dart';
import 'package:three/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [HomePage(), CalculatePage(), ContactPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculate App",
          style:
              TextStyle(fontFamily: "Maa", fontSize: 50, color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Homepage",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculate",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "Contact",
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.lightGreen[400],
        onTap: (index) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
