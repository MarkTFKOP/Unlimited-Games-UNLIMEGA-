import 'dart:io';

import 'package:flash_chat/screens/main_screen.dart';
import 'package:flash_chat/screens/setti.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flash_chat/componants/horlist.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/componants/produc.dart';
import 'package:flash_chat/componants/CartShopping.dart';
import 'package:flash_chat/Trade/trade_section.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'registration_screen.dart';
import 'package:flash_chat/componants/my_collection.dart';
import 'package:flash_chat/pages/details.dart';
import 'setti.dart';
import 'dart:math';

import 'setts.dart';


Random rnd = new Random();
int min = 121;
int max = 127;
int r = min + rnd.nextInt(max - min);


class MyApp extends StatefulWidget {
  static const String id = 'buspart';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('cara/watchdogs.jpg'),
          AssetImage('cara/spm.jpg'),
          AssetImage('cara/mortalkombat11.jpg'),
          AssetImage('cara/tifa.jpg'),
          AssetImage('cara/halflife.jpg'),
        ],
        autoplay: false,
        dotSize: 4.0,
        indicatorBgPadding: 5.0,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
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
                onPressed: () {
                  showSearch(context: context, delegate: Searchh());
                },
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
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('User Test$r'),
                  accountEmail: Text('markpereira199@gmail.com'),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "You are already on the home screen",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black38,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                  },
                  child: ListTile(
                    title: Text('Home Page'),
                    leading: Icon(Icons.home),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyCollection()));
                  },
                  child: ListTile(
                    title: Text('My CDs'),
                    leading: Icon(Icons.person),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('My orders'),
                    leading: Icon(Icons.shopping_basket),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  },
                  child: ListTile(
                    title: Text(''
                        'Shopping cart'),
                    leading: Icon(Icons.shopping_cart),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Favor()));
                  },
                  child: ListTile(
                    title: Text('Favorites'),
                    leading: Icon(Icons.favorite),
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Setssss()));
                  },
                  child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settingss()));
                  },
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(
                      Icons.help,
                      color: Colors.red,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                InkWell(
                  onTap: () { Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));},
                  child: ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.arrow_back),
                  ),
                ),
                InkWell(
                  onTap: () { exit(0);},
                  child: ListTile(
                    title: Text('Exit'),
                    leading: Icon(Icons.exit_to_app),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: <Widget>[
              image_carousel,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(color: Colors.white),
                ),
                //horizontal list begins here
              ),
              Holist(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recent products',
                  style: TextStyle(color: Colors.white),
                ),
                //horizontal list begins here
              ),
              Container(
                height: 200,
                child:
                    Products(), //calls class PRoducts inorder to display clickable images
              ),

//            GridView.count(
//              crossAxisCount: 2,
//              children: <Widget>[],
//            ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.chat),
            onPressed: () {
              Navigator.pushNamed(context, ChatScreen.id);
            },
          ),
        ),
      ),
    );
  }
}

class Categori extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final togo;
  Categori({this.image_location, this.image_caption, this.togo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => togo));
        },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 70.0,
              height: 50.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Searchh extends SearchDelegate<String> {
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
  final cdnames = [
    "Dragon Ball Z",
    "Marvel's Spiderman",
    "Fortnite",
    "Half Life",
    "Vice City",
    "San Andreas",
    "Ghostbusters",
  ];

  final recentSearches = [
    "Fortnite",
    "Half Life",
    "Vice City",
    "Ghostbusters",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    for (int i = 0; i <= productlist.length - 1; i++) {
      if (productlist[i]["name"].toString().toLowerCase() == query.toString().toLowerCase()) {
        return ProductDetails(
          product_name: productlist[i]["name"],
          product_pictu: productlist[i]["picture"],
          product_price: productlist[i]["oldprice"],
          product_oldp: productlist[i]["price"],
          produ_condu: productlist[i]["condition"],
        );
      }
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearches
        : cdnames.where((p) => p.contains(query)).toList();
    final simpleVar = suggestionList;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.trending_flat),
        onTap: () {
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}


class Favor extends StatelessWidget {
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
                    "Currently you have no favorites",
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
