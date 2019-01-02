import 'package:flutter/material.dart';
import 'myListPage.dart';
import 'counterPage.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ));

class TutorialHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text("Examples"),
            bottom: new TabBar(
              tabs: <Widget>[
                new Tab(icon: Icon(Icons.ac_unit)),
                new Tab(icon: Icon(Icons.blur_circular)),
              ],
            ),
          ),
          body: new MyTabBar(),
        ),
      ),
    );
  }
}

class MyTabBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return new TabBarView(
      children: <Widget>[
        new Counter(),
        new MyList(),
      ],
    );
  }
}
