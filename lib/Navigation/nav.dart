import 'package:flutter/material.dart';
import '../Screens/home.dart';
import '../Screens/map.dart';
import '../Screens/info.dart';

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
    InfoWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: tabs[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF1b1e44),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
            BottomNavigationBarItem(
              title: Text("Sobre"),
              icon: Icon(Icons.info),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
