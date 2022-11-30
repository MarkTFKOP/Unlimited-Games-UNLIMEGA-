import 'package:flash_chat/paymentss/addressss.dart';
import 'package:flutter/material.dart';
import 'Cart_products.dart';

class Cart extends StatefulWidget {
  static const String id = 'CartShopping';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var someThing = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text(
          'UNLIMEGA',
          style: TextStyle(
            color: Colors.tealAccent.shade200,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.tealAccent.shade200,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: CartProds()),
          //Container(height: 80, child: ForTotal()),
        ],
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.blue.shade900,
        child: Row(
          children: <Widget>[
//            Expanded(
//              child: ListTile(
//                title: Text(
//                  "Total:",
//                  style: TextStyle(color: Colors.white, fontSize: 16),
//                ),
//                subtitle: Text(
//                  "${someThing}",
//                  style: TextStyle(color: Colors.white, fontSize: 16),
//                ),
//              ),
//            ),
            Expanded(
              child: Text(""),
            ),
            Expanded(
              child: MaterialButton(
                color: Colors.red.shade900,
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Addr()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
