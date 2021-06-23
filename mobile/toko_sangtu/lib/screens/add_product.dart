import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toko_sangtu/screens/homepage.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  Future saveProduct() async {
    final response =
        await http.post(Uri.parse("http://192.168.43.170/api/products"), body: {
      "name": _nameController.text,
      "description": _descriptionController.text,
      "price": _priceController.text,
      "image_url": _imageUrlController.text,
    });
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Detail"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter product Name";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Description", border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter product Description";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: "Price", border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter product Price";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: "Image URL", border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter product Image URL";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                 children: <Widget>[
                  ButtonTheme(
                    minWidth: 50.0,
                    height: 50.0,
                    child: Expanded(
                      child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text(
                        "Cancel",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Penambahan Produk di Cancel")));
                      },
                    )),
                  ),
                  Container(
                    width: 15,
                  ),
                  ButtonTheme(
                    minWidth: 50.0,
                    height: 50.0,
                    child: Expanded(
                      child: RaisedButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Text(
                              "Save",
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                  saveProduct().then((value) {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => HomePage()));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Produk Berhasil di Add")));
                                  });
                                }
                            },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
