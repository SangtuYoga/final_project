import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toko_sangtu/dashboard.dart';
import 'package:toko_sangtu/screens/add_product.dart';
import 'package:toko_sangtu/screens/edit.product.dart';
import 'package:toko_sangtu/screens/product_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://192.168.43.170/api/products';

  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteProduct(String productId) async {
    String url = 'http://192.168.43.170/api/products/' + productId;

    var response = await http.delete(Uri.parse(url));
    var encodeFirst = json.encode(response.body);
    return json.decode(encodeFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProduct()));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        appBar: AppBar(
          title: const Text('List Produk'),
          actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Dashboard()));
                },
              )
            ],
        ),
        body: FutureBuilder(
            future: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(3.0),
                          height: 180,
                          child: Card(
                              elevation: 5,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetail(
                                                      product:
                                                          snapshot.data['data']
                                                              [index])));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      padding: EdgeInsets.all(5),
                                      height: 120,
                                      width: 120,
                                      child: Image.network(
                                        snapshot.data['data'][index]
                                            ['image_url'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                                snapshot.data['data'][index]
                                                    ['name'],
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(snapshot.data['data']
                                              [index]['description']),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        EditProduct(
                                                                          product:
                                                                              snapshot.data['data'][index],
                                                                        )));
                                                      },
                                                      child: Icon(Icons.edit)),
                                                  GestureDetector(
                                                      onTap: () {
                                                        deleteProduct(snapshot
                                                                .data['data']
                                                                    [index]
                                                                    ['id']
                                                                .toString())
                                                            .then((value) {
                                                          setState(() {});
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      "Produk Berhasil di Delete")));
                                                        });
                                                      },
                                                      child:
                                                          Icon(Icons.delete)),
                                                ]),
                                                Text("Rp. " +
                                                    snapshot.data['data'][index]
                                                        ['price']),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )));
                    });
              } else {
                return Text('Trying to connect database..');
              }
            }));
  }
}
