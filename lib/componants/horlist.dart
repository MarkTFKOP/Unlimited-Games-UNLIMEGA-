import 'package:flash_chat/screens/buspart.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Trade/trade_section.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Holist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            child: Categori(
              image_location: 'images/hands2.png',
              image_caption: 'trade',
              togo: TradePage(),
            ),
          ),
          InkWell(
            child: Categori(
              image_location: 'images/bluecart.png',
              image_caption: 'store',
              togo: MyApp(),
            ),
          ),
          InkWell(
            child: Categori(
              image_location: 'images/refurbished.png',
              image_caption: 'refurbished',

            ),
          ),
          InkWell(
            child: Categori(
              image_location: 'images/logo.png',
              image_caption: 'HOT DEALZ',
            ),
          ),
        ],
      ),
    );
  }
}
