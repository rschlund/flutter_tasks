import 'package:flutter/material.dart';
import 'counterPage.dart';
import 'myListPage.dart';

void main() {
  runApp(new MaterialApp(
    // Title
    title: "Using Tabs",
    // Home
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatefulWidget {
  TutorialHome({Key key}) : super(key: key);

  @override
  TutorialHomeState createState() => TutorialHomeState();
}

class TutorialHomeState extends State<TutorialHome> {
  int _selectedIndex = 0;

  final List _children = [
    new Counter(),
    new MyList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: _children[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text('Counter')),
          BottomNavigationBarItem(
              icon: Icon(Icons.blur_circular), title: Text('Star Wars')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
