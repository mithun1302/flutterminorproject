import 'package:flutter/material.dart';
import 'package:flutter_minor/Methods.dart';
import 'package:flutter_minor/address.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'account.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Mithun'),
              accountEmail: Text('mithunb986@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('Order History'),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('Help & Support'),
                leading: Icon(Icons.call),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('Updates'),
                leading: Icon(Icons.update),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountPage()));
                },
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () => logOut(context),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () => logOut(context),
                child: Text('Click here to Logout')),
            ElevatedButton(
                onPressed: openCheckout,
                child: Text('Click here for Payment')),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AccountPage()));
                },
                child: Text('Click here to add Name')),
            ElevatedButton(
                onPressed: (){
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddressPage()));
            },
                child: Text('Click here to add Address')),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1XF4SWlOAY8aF0',
      'amount': 2000,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!, toastLength: Toast.LENGTH_SHORT);
  }
}
