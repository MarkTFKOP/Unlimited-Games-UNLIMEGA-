import 'package:flutter/material.dart';

class Setssss extends StatefulWidget {
  @override
  _SetssssState createState() => _SetssssState();
}

class _SetssssState extends State<Setssss> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'UNLIMEGA',
            style: TextStyle(
              color: Colors.tealAccent.shade200,
            ),
          ),
          backgroundColor: Colors.blue.shade900,
          //actions: <Widget>[],
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Container(
              height: 150,
              child: Center(
                child: Card(
                  child: Center(
                    child: Text(
                      "This app is still in development, some features are not yet available",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
