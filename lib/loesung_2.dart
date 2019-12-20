import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ));

class TutorialHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController( //Controller für die TabBar, legt die Anzahl der Tabs fest
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Examples"),
          bottom: new TabBar(
            tabs: <Widget>[
              // Die anzuzeigenden Tabs
              new Tab(icon: new Icon(Icons.home)),
              new Tab(text: "Liste"),
            ],
          ),
        ),
        // Die anzuzeigenden Tabseiten
        body: new MyTabBarView(),
      ),
    );
  }
}

// Widget um die beiden Tabseiten anzuzeigen
class MyTabBarView extends StatelessWidget {
  Widget build(BuildContext context) {
    return new TabBarView( // Widget zur Abzeige der Tabseiten
      children: <Widget>[
        new Counter(), // Zählerseite
        new MyList(), // Listenseite
      ],
    );
  }
}

// Im Moment ist die Listenseite nur ein kurzer Text
class MyList extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Text("You selected second!");
  }
}

class Counter extends StatefulWidget {
  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter>
    with AutomaticKeepAliveClientMixin<Counter> { // Das Mixin persistiert den Zählerstand => wantKeepAlive auf true
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; // Muss auf true gesetzt werde, damit der Zähler persistent ist
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
