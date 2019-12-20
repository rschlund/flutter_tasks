import 'package:flutter/material.dart';
// Auslagerung der TabBarViews in eigene Dateien
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
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Examples"),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(icon: Icon(Icons.home)),
              new Tab(text: "Liste"),
            ],
          ),
        ),
        body: new MyTabBarView(),
      ),
    );
  }
}

class MyTabBarView extends StatelessWidget {
  Widget build(BuildContext context) {
    return new TabBarView(
      children: <Widget>[
        new Counter(),
        new MyList(),
      ],
    );
  }
}
