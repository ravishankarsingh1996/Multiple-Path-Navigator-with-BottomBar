import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

class PageTwo extends StatefulWidget {
  PageTwo({this.onPush, this.pageColor});

  final pageColor;
  final ValueChanged<int> onPush;
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
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
    return Container(
        child: Center(
          child: FlatButton(
            onPressed: () {
              widget.onPush(3);
            },
            child: Text('Press'),
            color: Colors.green,
            splashColor: Colors.red,
          ),
        ),
    );
  }
}
