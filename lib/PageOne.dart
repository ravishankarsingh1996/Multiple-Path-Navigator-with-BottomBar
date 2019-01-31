import 'package:flutter/material.dart';import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

class PageOne extends StatefulWidget {
  PageOne({this.onPush, this.pageColor});

  final pageColor;
  final ValueChanged<int> onPush;
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  void fetchData() async {
    get('http://gerber.cs.uchicago.edu/res/products.json').then((result) {
      Map userMap = jsonDecode(result.body);
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return  Container(
        child: Center(
          child: FlatButton(
            onPressed: () {
              widget.onPush(2);
            },
            child: Text('Press'),
            color: Colors.green,
            splashColor: Colors.red,
          ),
        ),
    );
  }
}
