import 'package:flutter/material.dart';
import 'home.dart';
import 'map.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final tabs = [
    CardsClass(),
    MapWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple[900],
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("Cards"),
            icon: Icon(Icons.reorder),
          ),
          BottomNavigationBarItem(
            title: Text("Mapa"),
            icon: Icon(Icons.map),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
