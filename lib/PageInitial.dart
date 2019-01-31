import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

class PageInitial extends StatefulWidget {
  PageInitial({this.onPush, this.pageColor});

  final pageColor;
  final ValueChanged<int> onPush;

  @override
  _PageInitialState createState() => _PageInitialState();
}

class _PageInitialState extends State<PageInitial> {
  void fetchData() async {
    get('http://gerber.cs.uchicago.edu/res/products.json').then((result) {
      Map userMap = jsonDecode(result.body);
      print(userMap);
    });
  }
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: () {
              widget.onPush(1);
            },
            child: Text('Press'),
            color: Colors.green,
            splashColor: Colors.red,
          ),
        ),
      ),
    );
  }
}

