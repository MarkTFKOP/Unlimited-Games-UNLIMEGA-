import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/componants/CartShopping.dart';
import 'package:flash_chat/componants/Cart_products.dart';
import 'package:flash_chat/paymentss/addressss.dart';
import 'package:flash_chat/screens/buspart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flash_chat/componants/produc.dart';

class ProductDetails extends StatefulWidget {
  final product_name;
  final product_pictu;
  final product_price;
  final product_oldp;
  final produ_condu;

  ProductDetails({
    this.product_name,
    this.product_pictu,
    this.product_price,
    this.product_oldp,
    this.produ_condu,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
} //contains initialized variables and constructor

class _ProductDetailsState extends State<ProductDetails> {
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
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            "${widget.product_price} RS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.tealAccent.shade200),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.product_oldp} ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.tealAccent.shade700,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                      await DatabaseService().updateUserData(
                          widget.product_name,
                          widget.product_price.toString(),
                          DateTime.now().toIso8601String().toString(),
                          widget.product_pictu);
                      print("done");
                    },
                    color: Colors.red,
                    child: Text(
                      'BUY NOW',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await DatabaseService().updateUserData(
                        widget.product_name,
                        widget.product_price.toString(),
                        DateTime.now().toIso8601String().toString(),
                        widget.product_pictu,
                      );
                      print("done");
                    }),
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
            //Product conditioin
            Container(
              color: Colors.black,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 5.0, 5.0, 5.0),
                    child: Text(
                      "Product condition : ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "${widget.produ_condu}",
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
            Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  'Similar products:',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Container(
              color: Colors.black,
              child: SizedBox(
                height: 20.0,
              ),
            ),
            Container(
              color: Colors.black,
              height: 360,
              child: SimilarProducts(),
            ),
          ],
        ),
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productlist = [
    {
      "name": "Dragon Ball Z",
      "picture": "caraimages/DBZBT3.jpg",
      "oldprice": 1500,
      "price": 800,
      "condition": "new",
    },
    {
      "name": "Ghostbusters",
      "picture": "caraimages/Ghostbuster2.jpg",
      "oldprice": 1000,
      "price": 350,
      "condition": "refurbished",
    },
    {
      "name": "San Andreas",
      "picture": "caraimages/GTASAN.jpg",
      "oldprice": 2000,
      "price": 699,
      "condition": "refurbished",
    },
    {
      "name": "Vice City",
      "picture": "caraimages/GTAVICE.jpg",
      "oldprice": 1400,
      "price": 800,
      "condition": "new",
    },
    {
      "name": "Half Life",
      "picture": "cara/halflife.jpg",
      "oldprice": 1700,
      "price": 899,
      "condition": "new",
    },
    {
      "name": "Fortnite",
      "picture": "images/fortinte.jpg",
      "oldprice": 2999,
      "price": 1399,
      "condition": "new",
    },
    {
      "name": "Marvel's Spiderman",
      "picture": "cara/spm.jpg",
      "oldprice": 3499,
      "price": 2599,
      "condition": "new",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productlist.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SimSingleprod(
            prodname: productlist[index]["name"],
            prodct: productlist[index]["picture"],
            prooldp: productlist[index]["oldprice"],
            prodpri: productlist[index]["price"],
            prodcon: productlist[index]["condition"]);
      },
    );
  }
}

class SimSingleprod extends StatelessWidget {
  final prodname;
  final prodct;
  final prooldp;
  final prodpri;
  final prodcon;
  SimSingleprod({
    this.prodname,
    this.prodct,
    this.prooldp,
    this.prodpri,
    this.prodcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Hero(
        tag: prodname,
        child: Material(
          elevation: 5.0,
          borderOnForeground: true,
          child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        product_name: prodname,
                        product_pictu: prodct,
                        product_price: prodpri,
                        product_oldp: prooldp,
                        produ_condu: prodcon,
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
                          Expanded(
                            flex: 1,
                            child: Text(
                              "$prooldp ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "$prodpri RS",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )))),
        ),
      ),
    );
  }
}

class DatabaseService {
  static final CollectionReference collectionName =
      Firestore.instance.collection("cart");

  var aakk = collectionName.document();
  Future updateUserData(
    String cdname,
    String cOst,
    String okay,
    String picte,
  ) async {
    return await aakk.setData({
      'csName': cdname,
      'cost': cOst,
      'date': okay,
      'pic': picte,
      'Idd': aakk.documentID,
    });
  }
}

//=============code removed : was used for drop downlists ================================================

//Drop down list Quality and Game Station
//            Container(
//              color: Colors.blue.shade600,
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    //alerts gamestation
//                    child: MaterialButton(
//                      onPressed: () {
//                        showDialog(
//                            context: context,
//                            builder: (context) {
//                              return AlertDialog(
//                                title: Text('Game Station'),
//                                content: Text("select the type of CD"),
//                                actions: <Widget>[
//                                  MaterialButton(
//                                    onPressed: () {
//                                      Navigator.pop(context);
//                                    },
//                                    child: Text(
//                                      "close",
//                                      style: TextStyle(color: Colors.blue),
//                                    ),
//                                  )
//                                ],
//                              );
//                            });
//                      },
//                      color: Colors.white,
//                      textColor: Colors.grey,
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(child: Text("Game Station")),
//                          Expanded(child: Icon(Icons.arrow_drop_down))
//                        ],
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    //alerts Quantity
//                    child: MaterialButton(
//                      onPressed: () {
//                        showDialog(
//                            context: context,
//                            builder: (context) {
//                              return AlertDialog(
//                                title: Text('Quantity'),
//                                content: Text('Select the quantity'),
//                                actions: <Widget>[
//                                  MaterialButton(
//                                    onPressed: () {
//                                      Navigator.pop(context);
//                                    },
//                                    child: Text(
//                                      'close',
//                                      style: TextStyle(color: Colors.blue),
//                                    ),
//                                  )
//                                ],
//                              );
//                            });
//                      },
//                      color: Colors.white,
//                      textColor: Colors.grey,
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(child: Text("Quantity")),
//                          Expanded(child: Icon(Icons.arrow_drop_down))
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Divider(
//              color: Colors.white,
//              thickness: 2.0,
//            ),
