import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Setting"), actions: [new Icon(Icons.search)]),
      body: Container(
          color: Colors.blue[100],
          child: new ListView(
            children: <Widget>[
              Container(
                height: 50,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("  My Profile"),
                      new Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("  My Addresses"),
                      new Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("  Language"),
                      new Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("  Privacy"),
                      new Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("  Notification Setting"),
                      new Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
