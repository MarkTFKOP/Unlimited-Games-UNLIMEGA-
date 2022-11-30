import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/Contents/niceonebutton.dart';
import 'package:flash_chat/screens/buspart.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class Okaayyyss extends StatefulWidget {
  @override
  _OkaayyyssState createState() => _OkaayyyssState();
}

class _OkaayyyssState extends State<Okaayyyss> {
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserA();
  }

  String costname;
  String cdnameeee;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: showSpinner,
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
            backgroundColor: Colors.blue.shade900,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'hello',
                      child: Container(
                        height: 200.0,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        cdnameeee = value;
                        //Do something with the user input.
                      },
                      decoration: kButtonLogin.copyWith(
                          hintText: 'Enter CD Name',
                          hintStyle: TextStyle(color: Colors.lightBlueAccent))),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      costname = value;
                      //Do something with the user input.
                    },
                    decoration: kButtonLogin.copyWith(
                        hintText: 'Enter CD Cost in ruppess',
                        hintStyle: TextStyle(color: Colors.lightBlueAccent)),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    color: Colors.blue,
                    text: 'Submit',
                    onPressed: () async {
                      try {
                        await DatabaseService(tuid: loggedInUserr.uid)
                            .updateUserData(
                                cdnameeee,
                                costname,
                                '${loggedInUserr.email}',
                                DateTime.now().toIso8601String().toString());
                        print(loggedInUserr.toString());
                        final myid = loggedInUserr.uid.toString();
                        final myemail = loggedInUserr.email.toString();
                        print('$myid,$myemail okay');
                      } catch (e) {
                        print(e.toString());
                      }

                      setState(() {
                        showSpinner = true;
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyCollection()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class DatabaseService {
  final tuid;

  DatabaseService({
    this.tuid,
  });

  final CollectionReference collectionName =
      Firestore.instance.collection(loggedInUserr.uid);

  Future updateUserData(
      String cdname, String cOst, String eMail, String okay) async {
    return await collectionName.document().setData(
        {'csName': cdname, 'cost': cOst, 'email': eMail, 'date': okay});
  }
}
