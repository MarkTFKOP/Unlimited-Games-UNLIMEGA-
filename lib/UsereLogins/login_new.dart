//import 'package:flash_chat/main.dart';
//import 'package:flash_chat/screens/buspart.dart';
//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//class Login extends StatefulWidget {
//  @override
//  _LoginState createState() => _LoginState();
//}
//
//class _LoginState extends State<Login> {
//  final GoogleSignIn googleSignIn = GoogleSignIn();
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  SharedPreferences preferences;
//  bool loading = false;
//  bool isLogedIn = false;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    isSigned();
//  }
//
//  void isSigned() async {
//    setState(() {
//      loading = true;
//    });
//    preferences = await SharedPreferences.getInstance();
//    isLogedIn = await googleSignIn.isSignedIn();
//    if (isLogedIn) {
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => MyApp()));
//    }
//    setState(() {
//      loading = false;
//    });
//  }
//
//  Future handleSignIn() async {
//    preferences = await SharedPreferences.getInstance();
//    setState(() {
//      loading = true;
//    });
//    GoogleSignInAccount googleUser = await googleSignIn.signIn();
//    GoogleSignInAuthentication googleSignInAuthentication =
//        await googleUser.authentication;
//    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(idToken)
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}
