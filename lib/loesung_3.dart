import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // Import um zufällige Wortpaare darzustellen

void main() => runApp(MaterialApp(
      title: 'Flutter Tutorial',
      home: new TutorialHome(),
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
              new Tab(icon: Icon(Icons.ac_unit)),
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

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter>
    with AutomaticKeepAliveClientMixin<Counter> {
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
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

class MyList extends StatefulWidget {
  @override
  MyListState createState() => new MyListState();
}

class MyListState extends State<MyList>
    with AutomaticKeepAliveClientMixin<MyList> {
  final _suggestions = <WordPair>[]; // Der Speicher für die aktuell benutzten Wortpaare

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) { // i ist die Anzahl der aktuellen potentiell unbegrenzten Listenelemente
          if (i.isOdd) return Divider();// Nur jedes zweite Element ist ein Wortpaar => index = i/2
          final index = i ~/ 2;
          if (index >= _suggestions.length) { // Neue Elemente erzeugen, wenn das Ende der Liste auf der Seite erreicht ist
            _suggestions.addAll(generateWordPairs().take(10)); // Füge 10 neue Wortpaare hinzu
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // Anzeige der Wortpaare in Listenkacheln
  Widget _buildRow(WordPair pair) {
    return ListTile( // Anzeige des Listenelementes als Kachel
      title: Text(
        pair.asPascalCase,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
