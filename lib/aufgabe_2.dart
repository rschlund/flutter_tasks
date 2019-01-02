import 'package:flutter/material.dart';

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
              new Tab(text: "Counter"),
              new Tab(text: "List"),
            ],
          ),
        ),
        body: new MyTabBar(),
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

class MyList extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Text("You selected second!");
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  void _decrement() {
    setState(() {
      --_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Row(),
        new CounterDisplay(count: _counter),
        new Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 30.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new ChangeCounterButton(upDown: "--", onPressed: _decrement),
                new ChangeCounterButton(upDown: "++", onPressed: _increment),
              ]),
        ),
      ],
    ));
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;

  //Konstruktor mit named Parameter
  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Counter: $count',
      style: TextStyle(fontSize: 25.0),
    );
  }
}

class ChangeCounterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String upDown;

  //Konstruktor mit named Parameter
  ChangeCounterButton({this.upDown, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).accentColor,
      onPressed: onPressed,
      child: new Text(upDown, style: TextStyle(color: Colors.white)),
    );
  }
}