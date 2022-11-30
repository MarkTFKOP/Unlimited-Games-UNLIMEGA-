import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/buspart.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Contents/niceonebutton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  static const String id = 'login_screen';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
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
                    validator: (val) => val.contains("@") ? null : 'Invalid',
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kButtonLogin.copyWith(
                      hintText: 'Enter your Email',
                    )),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  validator: (val) =>
                      val.length > 5 ? null : 'INVALID: password must be atleast 5 words',
                  onChanged: (value) {
                    password = value;
                    //Do something with the user input.
                  },
                  decoration: kButtonLogin.copyWith(
                    hintText: 'Enter your Password',
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  color: Colors.blue,
                  text: 'Log In',
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print(email);
                      print(password);
                    }

                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) Navigator.pushNamed(context, MyPrj.id);
                    } catch (e) {}

                    setState(() {
                      showSpinner = false;
                    });

                    // Navigator.pushNamed(context, MyPrj.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
