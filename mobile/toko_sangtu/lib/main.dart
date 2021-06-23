import 'package:flutter/material.dart';
import 'package:toko_sangtu/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primaryColor: Colors.red[900],
    ),
      title: 'Sangtu Store',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
