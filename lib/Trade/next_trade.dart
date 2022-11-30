import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Contents/niceonebutton.dart';
import 'package:flutter/material.dart';
import 'trade_section.dart';
import 'package:flash_chat/screens/buspart.dart';
import 'package:flash_chat/componants/my_collection.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUserr;
final _auth = FirebaseAuth.instance;

void GetUserA() async {
  final user = await _auth.currentUser();
  if (user != null) {
    try {
      loggedInUserr = user;

      print("${loggedInUserr.uid} from my collection");
      //print(loggedInUser.uid);
    } catch (e) {
      print(e.toString());
    }
  }
}

class TradeCheck extends StatefulWidget {
  final tradename;
  final tradePict;

  TradeCheck({
    this.tradename,
    this.tradePict,
  });
  @override
  _TradeCheckState createState() => _TradeCheckState();
}

class _TradeCheckState extends State<TradeCheck> {
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
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.blue,
        body: ListView(
          children: <Widget>[
            Container(

              height: 80,
              child: Card(color: Colors.blue.shade900,
                child: ListTile(
                  trailing: Text(
                    widget.tradename,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white54,
                      decoration: TextDecoration.underline),

                ),leading: Image.asset(widget.tradePict),

                  // child: MountainList(),
                  ),
            )
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.blue.shade900,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(
                    "Confirm Game:",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.red.shade900,
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Tradessss(pname : widget.tradename, ppic : widget.tradename)));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Tradessss extends StatefulWidget {


  final pname;
  final ppic;

  Tradessss({
    this.pname,
    this.ppic,
  });
  @override
  _TradessssState createState() => _TradessssState();
}

class _TradessssState extends State<Tradessss> {
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserA();
  }
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
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.blue,
        body: ListView(
          children: <Widget>[
            Container(color: Colors.blue.shade900,
              child: Center(child: Text("Select the CD you wish to trade with",
                  style:
                  TextStyle(
                      color: Colors.white,
                      fontSize: 17)),),
            ),
            Container(
              height: 550,
              child: trasec(),
            )


          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.blue.shade900,
        ),
      ),
    );
  }
}

class trasec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
      _firestore.collection(loggedInUserr.uid).orderBy('date').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messagesss = snapshot.data.documents.reversed;
        List<Cod> someMessage = [];
        for (var message in messagesss) {
          var messageText = message.data["cost"];
          var messageSender = message.data["csName"];
          var messageWidget = Cod(
            sentText: messageText,
            senderName: messageSender,
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

class Cod extends StatelessWidget {
  Cod({
    this.sentText,
    this.senderName,
  });
  final sentText;
  final senderName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        Navigator.push(
            context, MaterialPageRoute(
            builder: (context) =>
                Confimed(
                  baka: senderName,domo: sentText
                    )));

      },
      child: Card(
        child: ListTile(
          title: Row(
            children: <Widget>[
              Text(
                "Name: ",
                style: TextStyle(color: Colors.red),
              ),
              Text("$senderName"),
            ],
          ),
          subtitle: Row(
            children: <Widget>[
              Text(
                "Cost: ",
                style: TextStyle(color: Colors.red),
              ),
              Text("$sentText"),
            ],
          ),
        ),
      ),
    );
  }
}


class Confimed extends StatefulWidget {
  final baka;
  final domo;

  Confimed({
    this.baka,
    this.domo,
  });

  @override
  _ConfimedState createState() => _ConfimedState();
}

class _ConfimedState extends State<Confimed> {
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
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.blue,
        body: ListView(
          children: <Widget>[SizedBox(
            height: 10,
          ),


            Container(height: 40,
                child: Card(child: Center(child: Text("\nYour trade has been initiated\n ",style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),)),
            SizedBox(
              height: 400,
            ),
            RoundedButton(
              color: Colors.blue.shade900,
              text: 'Home',
              onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyApp(

                          )));
                }
            ),
          ],
        ),

      ),
    );
  }
}
