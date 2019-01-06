import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = "https://swapi.co/api/people";

// Function to get the JSON data
Future<List> getJSONData() async {

  var response = await http.get(
      // Encode the url
      Uri.encodeFull(url),
      // Only accept JSON response
      headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    return json.decode(response.body)['results'];
  } else {
    // If that response was not OK, throw an error.
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
      child: FutureBuilder<List>(
        future: getJSONData(),

        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return new Card(
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
