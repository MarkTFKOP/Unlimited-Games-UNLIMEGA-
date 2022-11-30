import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/Contents/niceonebutton.dart';
import 'package:flash_chat/componants/CartShopping.dart';
import 'package:flash_chat/componants/produc.dart';
import 'package:flash_chat/pages/details.dart';
import 'package:flash_chat/paymentss/addressss.dart';
import 'package:flash_chat/paymentss/paymode.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/componants/produc.dart';
import 'package:flash_chat/componants/CartShopping.dart';
import 'package:flutter/rendering.dart';

import 'my_collection.dart';

final _firestore = Firestore.instance;

class CartProds extends StatefulWidget {
  @override
  _CartProdsState createState() => _CartProdsState();
}

class _CartProdsState extends State<CartProds> {
  static int addvar = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("cart").orderBy('date').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messagesss = snapshot.data.documents.reversed;
        List<SomeCart> someMessage = [];
        for (var message in messagesss) {
          var messageText = message.data["cost"];
          addvar = addvar + int.parse(messageText);
          var messageSender = message.data["csName"];
          var picturee = message.data["pic"];
          var idds = message.data["Idd"];
          var messageWidget = SomeCart(
            cartproprice: messageText,
            cartproname: messageSender,
            cartpropict: picturee,
            cartid: idds,
          );
          someMessage.add(messageWidget);

          // fill list with data in variable messageWidget

        }
        return Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                children: someMessage, // show the list
              ),
            ),
          ],
        );
      },
    );
  }
}

//  cartproname: productlist[index]["name"],
//  cartpropict: productlist[index]["picture"],
//  cartproprice: productlist[index]["price"],
//  cartproquant: productlist[index]["quantity"],
//  cartstation: productlist[index]["game_station"],
List finalSelectedList = [1];

class SomeCart extends StatefulWidget {
  final cartproname;
  final cartpropict;
  final cartproprice;
  final cartid;

  int quanti = 1;

  SomeCart({
    this.cartproname,
    this.cartpropict,
    this.cartproprice,
    this.cartid,
  });

  @override
  _SomeCartState createState() => _SomeCartState();
}

class _SomeCartState extends State<SomeCart> {
  CollectionReference ref = _firestore.collection('cart');

  @override
  Widget build(BuildContext context) {
    print(finalSelectedList);
    if (widget.quanti <= 0) {
      //ref.document().
      ref.document("${widget.cartid}").delete();
    }

    return Column(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Image.asset(
              widget.cartpropict,
              height: 100,
            ),
            title: Text(widget.cartproname),
            subtitle: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Quantity:"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                        "${widget.quanti}",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
//                Padding(
//                  padding: EdgeInsets.all(5.0),
//                  child: Text("Game Station:"),
//                ),
//                Padding(
//                  padding: EdgeInsets.all(0.0),
//                  child: Text(
//                    "$cartstation",
//                    style: TextStyle(color: Colors.red),
//                  ),
//                ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "   ${int.parse(widget.cartproprice) * widget.quanti} RS",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900)),
                ),
              ],
            ),
            trailing: Column(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.arrow_drop_up),
                    onPressed: () {
                      setState(() {
                        widget.quanti++;
                        finalSelectedList.add(widget.quanti);
                        print(finalSelectedList);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      setState(() {
                        widget.quanti--;
                        finalSelectedList.add(widget.quanti);
                        print(finalSelectedList);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DatabaseService {
  final iddoc;

  DatabaseService({this.iddoc});

  static final CollectionReference collectionName =
      Firestore.instance.collection("cart");

  var aakk = collectionName;
  Future updateUserData(
    int qua,
  ) async {
    return await aakk.document(iddoc).updateData({
      'quan': qua,
    });
  }
}
