import 'package:flash_chat/Contents/niceonebutton.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/buspart.dart';

class MyPrj extends StatefulWidget {
  @override
  static const String id = 'main_screen';
  _MyPrjState createState() => _MyPrjState();
}

class _MyPrjState extends State<MyPrj> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('UNLIMEGA')),
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: 'hello',
                    child: Image.asset(
                      'images/logo.png',
                      height: 150.0,
                    ),
                  ),
                ),
                Text(
                  'WELCOME',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 25,
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 50,
                    endIndent: 50,
                  ),
                ),
                ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: CallMeColumn(
                        ie: AssetImage(
                          'images/fortinte.jpg',
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: CallMeColumn(
                        ie: AssetImage(
                          'images/battle5.jpg',
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: Container(
                        height: 50,
                        alignment: Alignment(0, 0),
                        color: Colors.white,
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: Container(
                        height: 50,
                        alignment: Alignment(0, 0),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: CallMeColumn(
                        ie: AssetImage(
                          'images/titan.jfif',
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: CallMeColumn(
                        ie: AssetImage(
                          'images/pirate.jpg',
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: Container(
                        height: 50,
                        alignment: Alignment(0, 0),
                        color: Colors.white,
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: Container(
                        height: 50,
                        alignment: Alignment(0, 0),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, MyApp.id);
          },
        ),
      ),
    );
  }
}
