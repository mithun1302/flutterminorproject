import 'package:flutter/material.dart';
import 'package:flutter_minor/address.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => new _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Profile"),
          backgroundColor: Colors.green.shade700,
        ),
        body: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg")
                        )
                    )),
                new Text("9988776655",
                    textScaleFactor: 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(

                      ),
                      hintText: 'Your Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(

                      ),
                      hintText: 'Email',
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AddressPage()));
                },
                    child: Text('Add Address')),
              ],
            ))
    )
    ;
  }
}
