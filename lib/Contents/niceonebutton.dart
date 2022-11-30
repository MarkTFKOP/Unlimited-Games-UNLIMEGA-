import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CallMeColumn extends StatelessWidget {
  final String text;
  final AssetImage ie;
  CallMeColumn({
    this.text,
    this.ie,
  });

  //'images/fortinte.jpg'
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        height: 200,
        alignment: Alignment(0, 0),
        color: Colors.white,
        child: Image(
          image: ie,
        ),
      ),
      onPressed: () {
        //TODO:cart
      },
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;

  RoundedButton({
    this.color,
    this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

//class Columnsss extends StatelessWidget {
//  final String text;
//  Columnsss(
//  {  this.text;
//   });
//
// @override
// Widget build(BuildContext context) {
//   return
//
//}
