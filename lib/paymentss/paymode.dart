import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/Contents/niceonebutton.dart';
import 'package:flash_chat/componants/Cart_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'confirmorder.dart';

final _firestore = Firestore.instance;

class PayMode extends StatefulWidget {
  final addre;
  int grpval = 0;
  PayMode({
    this.addre,
  });
  @override
  _PayModeState createState() => _PayModeState();
}

class _PayModeState extends State<PayMode> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: Text(
            'UNLIMEGA',
            style: TextStyle(
              color: Colors.tealAccent.shade200,
            ),
          ),
          backgroundColor: Colors.blue.shade900,
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: <Widget>[
            Center(
              child: Text(
                "Your Orders:",
                style: TextStyle(color: Colors.tealAccent),
              ),
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
            Center(
              child: Text(
                "Your Address:",
                style: TextStyle(color: Colors.tealAccent),
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
                    Center(
                      child: Text(
                        "Address: ${widget.addre}",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                "Select Payment mode:",
                style: TextStyle(color: Colors.tealAccent),
              ),
            ),
            Container(
              color: Colors.blue.shade900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          activeColor: Colors.red,
                          groupValue: widget.grpval,
                          onChanged: (T) {
                            setState(() {
                              widget.grpval = T;
                            });
                          },
                        ),
                        Text("Cash on Delivery"),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value: 2,
                          activeColor: Colors.red,
                          groupValue: widget.grpval,
                          onChanged: (T) {
                            setState(() {
                              widget.grpval = T;
                            });
                          },
                        ),
                        Text("Use Card on Delivery"),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value: 3,
                          activeColor: Colors.red,
                          groupValue: widget.grpval,
                          onChanged: (T) {
                            setState(() {
                              widget.grpval = T;
                            });
                          },
                        ),
                        Text("PayTM/GPay on delvery"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            RoundedButton(
                color: Colors.blue,
                text: 'Place Order',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewOrder(
                                addr: widget.addre,
                              )));
                })
          ],
        ),
      ),
    );
  }
}

class CartProds extends StatefulWidget {
  @override
  _CartProdsState createState() => _CartProdsState();
}

class _CartProdsState extends State<CartProds> {
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
        List<NewCard> someMessage = [];
        for (var message in messagesss) {
          int addvar = 0;
          var messageText = message.data["cost"];

          var messageSender = message.data["csName"];
          var picturee = message.data["pic"];
          int lnt = finalSelectedList.length;
          int quna = finalSelectedList[lnt - 1];

          addvar = addvar + (int.parse(messageText) * quna);

          var messageWidget = NewCard(
            cartproprice: messageText,
            cartproname: messageSender,
            cartpropict: picturee,
            quant: quna,
            total: addvar,
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

class NewCard extends StatelessWidget {
  final cartproprice;
  final cartproname;
  final cartpropict;
  int quant;
  final total;
  NewCard({
    this.cartproname,
    this.cartproprice,
    this.cartpropict,
    this.quant,
    this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cartpropict, height: 100),
        title: Text("$cartproname"),
        subtitle: Text("$total"),
        trailing: Text("$quant"),
      ),
    );
  }
}

class DatabaseService {
  final tuid;

  DatabaseService({
    this.tuid,
  });

  final CollectionReference collectionName =
      Firestore.instance.collection("order");

  Future updateUserData(
      String cdname, String cOst, String eMail, String okay) async {
    return await collectionName.document().setData(
        {'csName': cdname, 'cost': cOst, 'email': eMail, 'date': okay});
  }
}
