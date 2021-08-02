import 'package:flutter/material.dart';
import 'package:flutter_minor/CreateAccount.dart';
import 'package:flutter_minor/LoginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Login')),
            ElevatedButton(onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateAccount()));
              }, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}