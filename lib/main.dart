import 'package:flash_chat/componants/CartShopping.dart';
import 'package:flash_chat/screens/buspart.dart';
import 'package:flash_chat/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/componants/CartShopping.dart';
import 'UsereLogins/login_new.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Login(),
      initialRoute: WelcomeScreen.id,
      routes: {
        Cart.id: (context) => Cart(),
        MyApp.id: (context) => MyApp(),
        MyPrj.id: (context) => MyPrj(),
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
