import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  String mess;
  @override
  void initState() {
    super.initState();
    getUserE();
  }

  void getUserE() async {
    final user = await _auth.currentUser();

    if (user != null) {
      try {
        loggedInUser = user;
        print(loggedInUser.email);
      } catch (e) {
        print(e);
      }
    }
  }

//  void messageStream() async {
//    await for (var snapshotss
//        in _firestore.collection("messages").snapshots()) {
//      for (var messagess in snapshotss.documents) {
//        print(messagess.data);
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡Community chat'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Container(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          mess = value; //Do something with the user input.
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        messageTextController.clear();
                        _firestore.collection("messages").add({
                          "text": mess,
                          "sender": loggedInUser.email,
                          "date": DateTime.now().toIso8601String().toString()
                          //"timestamp": Timestamp.now(),
                        }); //Implement send functionality.;
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('date').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messagesss = snapshot.data.documents.reversed;
        List<messageBubble> someMessage = []; //atm list is empty
        for (var message in messagesss) {
          final messageText = message.data["text"];
          final messageSender = message.data["sender"];
          final currentUser = loggedInUser.email;

          if (currentUser == messageSender) {
            //print bool
            // used to compare current user and other users
          }
          final messageWidget = messageBubble(
            sentText: messageText,
            senderName: messageSender,

            isMe: currentUser ==
                messageSender, // can also beused instead of if statment
          );
          someMessage.add(
              messageWidget); // fill list with data in variable messageWidget
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: someMessage, // show the list
          ),
        );
      },
    );
  }
}

class messageBubble extends StatelessWidget {
  messageBubble({
    this.sentText,
    this.senderName,
    this.isMe,
  });
  final sentText;
  final senderName;
  final isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$senderName",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30))
                : BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
            color: isMe ? Colors.white : Colors.lightBlueAccent.shade700,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("$sentText"),
            ),
          ),
        ],
      ),
    );
  }
}
