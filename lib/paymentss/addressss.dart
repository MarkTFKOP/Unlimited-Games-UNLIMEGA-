import 'package:flash_chat/componants/Cart_products.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/paymentss/paymode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Contents/niceonebutton.dart';

class Addr extends StatefulWidget {
  final one;
  final two;
  final three;
  final four;
  Addr({this.one, this.two, this.three, this.four});

  @override
  _AddrState createState() => _AddrState();
}

class _AddrState extends State<Addr> {
  String lineone;
  String linetwo;
  String linethree;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("${widget.one}");
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text(
          'UNLIMEGA',
          style: TextStyle(
            color: Colors.tealAccent.shade200,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Card(
                    child: Center(
                      child: Text(
                        "Enter your address",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1.75,
                  indent: 30,
                  endIndent: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: TextFormField(
                    decoration: kButtonLogin.copyWith(hintText: 'Line one'),
                    validator: (val) => val.isEmpty ? 'Cannot be empty' : null,
                    onChanged: (value) {
                      lineone = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1.75,
                  indent: 30,
                  endIndent: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  child: TextFormField(
                    decoration: kButtonLogin.copyWith(hintText: 'Line two'),
                    validator: (val) => val.isEmpty ? 'Cannot be empty' : null,
                    onChanged: (value) {
                      linetwo = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1.75,
                  indent: 30,
                  endIndent: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  child: TextFormField(
                    decoration: kButtonLogin.copyWith(hintText: 'Line three'),
                    validator: (val) => val.isEmpty ? 'Cannot be empty' : null,
                    onChanged: (value) {
                      linethree = value;
                    },
                  ),
                ),
                RoundedButton(
                  color: Colors.blue,
                  text: 'Next',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print(linetwo);
                      print(linetwo);
                      print(linethree);
                      String five =
                          "\n$lineone\n" + "$linetwo\n" + "$linethree";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PayMode(
                                    addre: five,
                                  )));
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.blue.shade900,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 40,
                color: Colors.red,
              ),
            ),
            Expanded(
                child: Container(
              height: 40,
              color: Colors.red,
            ))
          ],
        ),
      ),
    ));
  }
}
