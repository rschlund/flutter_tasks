import 'package:flutter/material.dart';
import 'dart:async'; // Api für asynchrone Methodenaufrufe
import 'package:http/http.dart' as http; // Api für Datenaustausch über http
import 'dart:convert'; // Api zur Dekodierung von JSON Code

final String url = "https://swapi.co/api/people";

// Funktion um per HTTP die JSON Daten zu holen
Future<List> getJSONData(String url) async {
  var response = await http.get( // Die Methode soll auf die Ergebnisse der HTTP Anfrage warten
      // Encode the url
      Uri.encodeFull(url), // Übergabe der URL
      // Only accept JSON response
      headers: {"Accept": "application/json"}); // Es soll nur JSON Code akzeptiert werden

  if (response.statusCode == 200) {
    return json.decode(response.body)['results']; // Parsen des JSON Code
  } else {
    throw Exception('Failed to load post');
  }
}

class MyList extends StatefulWidget {
  @override
  MyListState createState() => new MyListState();
}

class MyListState extends State<MyList>
    with AutomaticKeepAliveClientMixin<MyList> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: FutureBuilder<List>( // Baut sich nach Ergebnissen des Future getJSONData() auf
        future: getJSONData(url),

        builder: (context, snapshot) {
          if (snapshot.hasData) { // Noch keine Daten => zeige CircularProgressIndicator()
            return new ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return new Card( // Karte statt ListTile
                    child: new Container(
                      child: new Text(
                        snapshot.data[i]['name'],
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.lightBlueAccent),
                      ),
                      padding: const EdgeInsets.all(15.0),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
