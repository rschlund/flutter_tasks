import 'package:flutter/material.dart';


// Jede Flutter Anwendung muss eine main Mehode haben
void main() => runApp(MaterialApp( // Legt das Design auf Android fest
      title: 'Flutter Tutorial', // Titel der App auf dem Smartphone
      home: TutorialHome(), // Wurzel des Kontextbaums
    ));

// Jedes Stateless Widget muss die build-Methode überschreiben, deren Rückgabewert die Inhalte sind,
// die dargstellt werden sollen
class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold( // Rahmen der Anwendung
      appBar: new AppBar( //AppBar am oberen Rand der Anwednung
        title: new Text("Examples"),
      ),
      body: new Counter(), // Der Counter zur Anzeige der Klicks
    );
  }
}

//Die StateFulWidgets selbst sind zustandslos, aber sie erzeugen die Zustände
class Counter extends StatefulWidget {
  @override
  CounterState createState() => CounterState();
}

// Das ist eine Klasse zur Speicherung von Zuständen
class CounterState extends State<Counter> {
  // In den Attributen der Klasse werden die Zustände gespeicher
  int counter = 0;

  void _increment() { // Callback zur Änderung des Zustandes
    setState(() { // Aufruf die Seite zu aktuelisieren, aber nur den Baum unterhalb von Counter()
      ++counter;
    });
  }

  void _decrement() { // Callback zur Änderung des Zustandes
    setState(() { // Aufruf die Seite zu aktuelisieren, aber nur den Baum unterhalb von Counter()
      --counter;
    });
  }

  //Auch die Zustandsklasse muss die Build-Methode überschreiben, das ist der Teil des Konzextbaums,
  // der durch den setState() Aufruf aktualisiert wird
  @override
  Widget build(BuildContext context) {
    return new Center( // Widget zur Zentrierung der Anzeige
      child: new Column( // Spalten Widget
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Verteilung des Raums zwischen den Spalten
        children: <Widget>[
          new Row(), // Zeilen Widget
          new CounterDisplay(counter: counter), // Widget zur Anzeige
          new Padding( // Padding für das Child, hier das Row Widget
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 30.0), //Die Werte für das Padding in Pixel
            child: Row( // Zeilen Widget
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Verteilung des Raums zwischen den Spalten
              children: <Widget>[
                new ChangeCounterButton(upDown: "--", onPressed: _decrement), // Button zum herunterzählen
                new ChangeCounterButton(upDown: "++", onPressed: _increment), // Button zum hochzählen
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget zur Anzeige des Zählers
class CounterDisplay extends StatelessWidget {

  final int counter;
  CounterDisplay({this.counter}); // Wird jedesmal bei Aktualisierung mit neuem Zählerstand initialisiert

  @override
  Widget build(BuildContext context) {
    return Text(
      'Counter: $counter',
      style: TextStyle(fontSize: 25.0),
    );
  }
}

// Widget zur Erzeugung der Buttons mit der passenden Beschriftung und den entsprechenden Callbacks
class ChangeCounterButton extends StatelessWidget {
  final VoidCallback onPressed; // Calback Methode
  final String upDown; // Beschriftung des Button

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
