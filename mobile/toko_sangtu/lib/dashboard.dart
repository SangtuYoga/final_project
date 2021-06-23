import 'package:flutter/material.dart';
import 'package:toko_sangtu/screens/homepage.dart';
import './about.dart';
import './setting.dart';
import "./drawer.dart" as drawer;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: new Text("Dashboard"),
            ),
        backgroundColor: Colors.teal,
        drawer: drawer.Menudrawer(),
        body: Container(
          color: Colors.blue[100],
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Image(
                    image: AssetImage("assets/banner.png"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 90,
                        height: 90,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                 IconButton(
                                      icon: Icon(Icons.format_list_bulleted),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      },
                                    ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("List Produk"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 90,
                          height: 90,
                          //color: Colors.red,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: new Icon(Icons.settings),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (context) {
                                            return Setting();
                                          }),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("Pengaturan"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Container(
                          width: 90,
                          height: 90,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon:
                                          new Icon(Icons.help_outline_outlined),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (context) {
                                            return About();
                                          }),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("Tentang"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
