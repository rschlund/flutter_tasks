import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ));

class TutorialHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Examples"),
        ),
        body: new Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int counter = 0;

  void _increment() {
    setState(() {
      ++counter;
    });
  }

  void _decrement() {
    setState(() {
      --counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Row(),
        new CounterDisplay(count: counter),
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

  //Konstruktor mit named Parametern
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
