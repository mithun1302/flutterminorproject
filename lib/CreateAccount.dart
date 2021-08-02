import "package:flutter/material.dart";
import 'package:flutter_minor/Methods.dart';
import 'package:flutter_minor/HomeScreen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password= TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading? Center(child: Container(
        height: size.height / 20,
        width: size.width / 20,
        child: CircularProgressIndicator(),

      )): SingleChildScrollView(child: Column(children: [SizedBox(
        height: size.height / 20,
      ),
        Container(
          alignment: Alignment.centerLeft,
          width: size.width / 1.2,
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios), onPressed: () {}
          ),
        ),
        SizedBox(
          height: size.height / 50,
        ),

        Container(
          width: size.width / 1.3,
          child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Container(
          width: size.width / 1.3,
          child: Text(
            "Create Account",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 20,
              fontWeight: FontWeight.w500,

            ),
          ),
        ),
        SizedBox(
          height: size.height / 10,
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 18.0)),
        Container(
          width: size.width,
          alignment: Alignment.center,
          child: field(size, "Name", Icons.account_box, _name),
        ),
        Container(
          width: size.width,
          alignment: Alignment.center,
          child: field(size, "E-Mail", Icons.account_box, _email),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child:Container(
            width: size.width,
            alignment: Alignment.center,
            child: field(size, "Password", Icons.lock, _password),
          ),
        ),
        SizedBox(
          height: size.height / 20,
        ),
        customButton(size),
        Padding(
          padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        ),
        ),
      ],
      ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
    onTap:  () {
      if (_name.text.isNotEmpty &&
      _email.text.isNotEmpty &&
          _password.text.isNotEmpty){
        setState(() {
          isLoading = true;
        });

        createAccount(_name.text, _email.text, _password.text)
        .then((user) {
          if (user != null) {
            setState(() {
              isLoading = false;
            });
            Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            print("Account created successfully");
          } else {
            print ("Login Failed");
            setState(() {
              isLoading = false;
            });
          }
        });
      }
      else{
        print("Please fill all the fields");
      }
    },
        child: Container(
      height: size.height / 14,
      width: size.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple,
      ),
      alignment: Alignment.center,
      child: Text(
        "Create Account",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
        ),
    );
  }

  Widget field(Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 12,
      width: size.width / 1.2,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}
