import 'package:flutter/material.dart';
import 'package:flash_chat/pages/details.dart';
import 'package:flash_chat/componants/horlist.dart';
import 'package:flash_chat/componants/CartShopping.dart';
import 'package:flash_chat/screens/buspart.dart';

import 'next_trade.dart';

class TradePage extends StatefulWidget {
  static const String id = 'trade_section';
  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  var tradelist = [
    {
      "name": "Dragon Ball Z",
      "picture": "caraimages/DBZBT3.jpg",
    },
    {
      "name": "Ghostbusters",
      "picture": "caraimages/Ghostbuster2.jpg",
    },
    {
      "name": "San Andreas",
      "picture": "caraimages/GTASAN.jpg",
    },
    {
      "name": "Vice City",
      "picture": "caraimages/GTAVICE.jpg",
    },
    {
      "name": "Half Life",
      "picture": "cara/halflife.jpg",
    },
    {
      "name": "Fortnite",
      "picture": "images/fortinte.jpg",
    },
    {
      "name": "Marvel's Spiderman",
      "picture": "cara/spm.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'TRADE SECTION',
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
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.tealAccent.shade200,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ));
              },
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: GridView.builder(
          itemCount: tradelist.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return SinglePro(
              prodname: tradelist[index]["name"],
              prodct: tradelist[index]["picture"],
//            prooldp: tradelist[index]["oldprice"],
//            prodpri: tradelist[index]["price"],
//            prodcon: tradelist[index]["condition"]);
            );
          },
        ),
      ),
    );
  }
}

class SinglePro extends StatelessWidget {
  final prodname;
  final prodct;
//  final prooldp;
//  final prodpri;
//  final prodcon;
  SinglePro({
    this.prodname,
    this.prodct,
//    this.prodpri,
//    this.prooldp,
//    this.prodcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 5.0,
      child: Hero(
        tag: prodname,
        child: Material(
          elevation: 5.0,
          borderOnForeground: true,
          child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TradeDetails(
                        product_name: prodname,
                        product_pictu: prodct,
//                    product_price: prodpri,
//                    product_oldp: prooldp,
//                    produ_condu: prodcon,
                      ))),
              child: GridTile(
                  child: Image.asset(
                    prodct,
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                      color: Colors.white70,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Text(
                                "$prodname",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              )),
                        ],
                      )))),
        ),
      ),
    );
  }
}

class TradeDetails extends StatefulWidget {
  final product_name;
  final product_pictu;
  final product_price;
  final product_oldp;
  final produ_condu;

  TradeDetails({
    this.product_name,
    this.product_pictu,
    this.product_price,
    this.product_oldp,
    this.produ_condu,
  });

  @override
  _TradeDetailsState createState() => _TradeDetailsState();
} //contains initialized variables and constructor

class _TradeDetailsState extends State<TradeDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
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
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.tealAccent.shade200,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.tealAccent.shade200,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            //Image and name
            Container(
              height: 300,
              child: GridTile(
                child: Container(
                  color: Colors.white54,
                  child: Image.asset(widget.product_pictu),
                ),
                footer: Container(
                  color: Colors.black,
                  child: ListTile(
                    leading: Text(
                      widget.product_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
            ),
//
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            //buy and shopping cart favorite
            Row(
              children: <Widget>[
                //buy now and icons
                Expanded(
                  child: MaterialButton(

                    elevation: 5.0,
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TradeCheck(
                            tradename: widget.product_name,
                            tradePict: widget.product_pictu,
                          ),
                        ));},
                    color: Colors.red,
                    child: Text(
                      'Trade',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {}),
              ],
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            //Product Details
            Container(
              color: Colors.black,
              child: ListTile(
                title: Text(
                  "Product Details:",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "The story mode of the series (called Z Battle Gate, Dragon Adventure, and Dragon History in each installment, respectively) progresses similarly to the story modes in previous games. Players can select battles from different sagas and proceed through the story of Dragon Ball, Dragon Ball Z, Dragon Ball GT, and even several Dragon Ball Z films",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            //additional product information
            Container(
              color: Colors.black,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 5.0, 5.0, 5.0),
                    child: Text(
                      "Product name : ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "${widget.product_name}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
