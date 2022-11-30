import 'package:flutter/material.dart';

class Settingss extends StatefulWidget {
  @override
  _SettingssState createState() => _SettingssState();
}

class _SettingssState extends State<Settingss> {
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
              child: Card(
                child: Center(
                  child: Text(
                    "*  This app can be used to buy/purchase CDs from our collection .\n*  you can also use our community chat feature to chat with all othere users of this app .\n * you can also use the trade section , to trade your own CDs with the CDs available on the website",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
