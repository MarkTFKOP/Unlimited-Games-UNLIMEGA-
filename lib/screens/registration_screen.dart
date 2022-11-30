import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Contents/niceonebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'buspart.dart';
import 'package:flash_chat/componants/my_collection.dart';

FirebaseUser user;

class RegistrationScreen extends StatefulWidget {
  @override
  static const String id = 'registration_screen';
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  //FirebaseUser newUser;
  //FirebaseUser user;
  final _formkey = GlobalKey<FormState>();
  bool showSpinner = false;
  String email;
  String password;

//  Future regi(String email, String password) async {
//    AuthResult result = await
//        _auth.createUserWithEmailAndPassword(email: email, password: password);
//    FirebaseUser user = result.user;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formkey,
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
                    validator: (val) => val.contains("@") ? null : 'Invalid',
                    onChanged: (value) {
                      email = value; //Do something with the user input.
                    },
                    decoration: kButtonLogin.copyWith(
                      hintText: 'Enter your Email',
                    )),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (val) =>
                      val.length < 5 ? 'INVALID: password must be atleast 5 words' : null,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value; //Do something with the user input.
                  },
                  decoration: kButtonLogin.copyWith(
                    hintText: 'Enter your Password',
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          print(email);
                          print(password);
                        }
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          AuthResult result =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email.trim(), password: password);
                          user = result.user;
//                          final newUser =
//                              await _auth.createUserWithEmailAndPassword(
//                                  email: email.trim(), password: password);
                          await DatabaseService(tuid: user.uid).updateUserData(
                              'John Wick',
                              1500,
                              '${user.email}',
                              DateTime.now().toIso8601String().toString());
                          print(user.toString());
                          final myid = user.uid.toString();
                          final myemail = user.email.toString();
                          print('$myid,$myemail okay');

                          //print(newUser);
                          if (user != null) {
                            Navigator.pushNamed(context, MyApp.id);
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                        setState(() {
                          showSpinner = false;
                        });
                        print('try catch completerd');
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
      Firestore.instance.collection(user.uid);

  Future updateUserData(
      String cdname, int cOst, String eMail, String okay) async {
    return await collectionName.document().setData(
        {'csName': cdname, 'cost': cOst, 'email': eMail, 'date': okay});
  }
}

//Future regiWithEP(String email , String password)async{
//    try{
//      AuthResult result =  await _auth.createUserWithEmailAndPassword(
//          email: email.trim(), password: password);
//      FirebaseUser  = result.User;
//    }
//    catch(e)
//  {

/*onPressed: () async {
                try {
                  final newUser = await _authe.createUserWithEmailAndPassword(
                      email: emails, password: passwords);
                  //print(newUser);
                  if (newUser != null) {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
                print('try catch completerd');
              },

 */
