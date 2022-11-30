import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/buspart.dart';
import 'package:flash_chat/screens/add_cd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUserr;
final _auth = FirebaseAuth.instance;

void GetUserA() async {
  final user = await _auth.currentUser();
  if (user != null) {
    try {
      loggedInUserr = user;
      //print(loggedInUser.uid);
    } catch (e) {
      print(e.toString());
    }
  }
}

class MyCollection extends StatefulWidget {
  @override
  _MyCollectionState createState() => _MyCollectionState();
}

class _MyCollectionState extends State<MyCollection> {
  @override
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
        body: ListView(
          children: <Widget>[
            Container(
              height: 550,
              child: MountainList(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Okaayyyss()));
          },
        ),
      ),
    );
  }
}

class MountainList extends StatelessWidget {
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
        List<Codesss> someMessage = [];
        for (var message in messagesss) {
          var messageText = message.data["cost"];
          var messageSender = message.data["csName"];
          var messageWidget = Codesss(
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

class Codesss extends StatelessWidget {
  Codesss({
    this.sentText,
    this.senderName,
  });
  final sentText;
  final senderName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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

//
//class MessagesStream extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//        stream: _firestore.collection(asad).orderBy('date').snapshots(),
//        builder: (context, snapshot) {
//          if (!snapshot.hasData) {
//            return Center(
//              child: CircularProgressIndicator(
//                backgroundColor: Colors.lightBlueAccent,
//              ),
//            );
//          } else {
//            final messagesss = snapshot.data.documents.reversed;
//            List<CDcard> someMessage = []; //atm list is empty
//            for (var message in messagesss) {
//              final messageText = message.data['cost'];
//              final messageSender = message.data['csName'];
//              final currentUser = loggedInUserr.email;
//
//              final messageWidget = CDcard(
//                sentText: messageText,
//                senderName: messageSender,
//              );
//              someMessage.add(
//                  messageWidget); // fill list with data in variable messageWidget
//            }
//
//            return Expanded(
//              child: ListView(
//                reverse: true,
//                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//                children: someMessage, // show the list
//              ),
//            );
//          }
//        });
//  }
//}
//
//class CDcard extends StatelessWidget {
//  CDcard({
//    this.sentText,
//    this.senderName,
//  });
//  final sentText;
//  final senderName;
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(10.0),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Text(
//            "$senderName",
//            style: TextStyle(fontSize: 12, color: Colors.white),
//          ),
//        ],
//      ),
//    );
//  }
//}

//==============================anther try=========================
//class Okayy extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder(
//        stream: Firestore.instance.collection(loggedInUserr.uid).snapshots(),
//        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//          if (!snapshot.hasData) return new Text('Loading...');
//          return ListView.builder(
//              itemCount: snapshot.data.documents.length,
//              itemBuilder: (context, index) {
//                DocumentSnapshot ds = snapshot.data.documents[index];
//                return Container(
//                  child: Card(
//                      child: ListTile(
//                    title: Text(ds['csName']),
//                  )),
//                );
//              });
//        });
//  }
//}

// ================================= CODE TO RETIEVE SINGLE DOCUMENT ================================

//class Trail extends StatelessWidget {
//  final theID;
//
//  Trail({this.theID});
//
//  @override
//  Widget build(BuildContext context) {
//    return new StreamBuilder(
//      stream: Firestore.instance
//          .collection(loggedInUserr.uid).document("")
//          .snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return Text("Loading");
//        }
//        var userDocument = snapshot.data;
//        return Card(
//          child: ListTile(
//            leading: Text(
//              userDocument["csName"],
//              style: TextStyle(
//                color: Colors.tealAccent,
//              ),
//            ),
//            title: Text(
//              userDocument["cost"],
//              style: TextStyle(
//                color: Colors.tealAccent.shade200,
//              ),
//            ),
//          ),
//        );
//      },
//    );
//  }
//}

//======================= another way to retrieve code  from db===============================
