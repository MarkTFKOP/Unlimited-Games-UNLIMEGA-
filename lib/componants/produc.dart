import 'package:flash_chat/pages/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
        return Singleprod(
            prodname: productlist[index]["name"],
            prodct: productlist[index]["picture"],
            prooldp: productlist[index]["oldprice"],
            prodpri: productlist[index]["price"],
            prodcon: productlist[index]["condition"]);
      },
    );
  }
}

class Singleprod extends StatelessWidget {
  final prodname;
  final prodct;
  final prooldp;
  final prodpri;
  final prodcon;
  Singleprod({
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
