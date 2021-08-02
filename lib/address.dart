import 'package:flutter/material.dart';
class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Address'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Column(
        children:<Widget> [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Full Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'House No./Building Name*',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Locality',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                border: UnderlineInputBorder(),
                labelText: 'City',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                border: UnderlineInputBorder(),
                labelText: 'Pincode',
              ),
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text('Add Address'))
        ],
      ),
    );
  }
}
