import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/Contents/niceonebutton.dart';
import 'package:flash_chat/screens/buspart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'paymode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

CollectionReference ref = _firestore.collection("cart");

class NewOrder extends StatefulWidget {
  final addr;

  NewOrder({this.addr});

  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              // use this type of navigator
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
              //Navigator.pushNamed(context, MyApp.id);//does not work
            },
            child: Text(
              'UNLIMEGA',
              style: TextStyle(
                color: Colors.tealAccent.shade200,
              ),
            ),
          ),
          backgroundColor: Colors.blue.shade900,
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Order Successful",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1.75,
              indent: 30,
              endIndent: 30,
            ),
            Container(height: 150, child: CartProds()),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.white,
              thickness: 1.75,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.blue,
              height: 100,
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Address: ${widget.addr}",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.blue,
              height: 100,
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Thank you for ordering \n Your order will be dilvered before \n ${DateTime.now().day + 8} ${DateFormat.yMMM().format(DateTime.now())} ",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            RoundedButton(
              color: Colors.blue,
              text: "Go Back",
              onPressed: () {



                _firestore.collection('cart').getDocuments().then((snapshot) {
                  for (DocumentSnapshot ds in snapshot.documents){
                    ds.reference.delete();
                  }
                });
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            )
          ],
        ),
      ),
    );
  }
}
