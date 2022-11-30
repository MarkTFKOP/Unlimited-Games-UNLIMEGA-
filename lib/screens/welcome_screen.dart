import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/Contents/niceonebutton.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  static const String id = 'welcome_screen';
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation anim;
  Animation ten;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
      upperBound: 1,
    );
    anim = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    ten = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();

    //controller.reverse(from: 1.0);
    controller.addStatusListener((status) {
      print(status);
      /* if (anim.status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (anim.status == AnimationStatus.dismissed) {
        controller.forward();
      }

      */
    });

    controller.addListener(() {
      setState(() {});
      //print(anim.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red.withOpacity(controller.value),
      backgroundColor: ten.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'hello',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: anim.value * 100,
                  ),
                ),
                Expanded(
                  child: Text(
                    //'${controller.value.toInt()}%',
                    'UNLIMEGA',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.blueGrey,
              text: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blue,
              text: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
() {
Navigator.pushNamed(
(context), LoginScreen.id); //Go to login screen.
},

 */
