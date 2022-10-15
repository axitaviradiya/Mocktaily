import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:razorpay_flutter/razorpay_flutter.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  static const platform = const MethodChannel("razorpay_flutter");
  late Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar:
      AppBar(
        backgroundColor: Color.fromARGB(255, 24, 28, 76),
        title: Text("Add to Cart Product",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white,
        ),
      ),),
      body: SafeArea(
        child:StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users-cart-items").doc(FirebaseAuth.instance.currentUser!.email).collection("items").snapshots(),
          builder: (BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Center(child: Text("Something is wrong"),);
          }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
              itemBuilder: (_,index){
                  DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Text(_documentSnapshot['title'],style: TextStyle(fontWeight: FontWeight.bold),),


                      title: Text("\$ ${_documentSnapshot["description"]}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                      trailing: GestureDetector(
                        child: IconButton(
                          color: Color.fromARGB(255, 24, 28, 76),
                          icon: Icon(Icons.remove_circle_outline,), onPressed: () {  FirebaseFirestore.instance.collection("users-cart-items").doc(FirebaseAuth.instance.currentUser!.email).collection("items").doc(_documentSnapshot.id).delete(); },

                        ),

                      ),

                    ),

                  );

              },
            );

          },
        ) ,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
              openCheckout();
          },
          backgroundColor: Color.fromARGB(255, 24, 28, 76),
          icon: Icon(
            Icons.check_box_outlined,
          ),
          label: Text(
              'Check out',
              style:TextStyle(
                color: Colors.white,
              )
          )),
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
      'key': 'rzp_test_SJDNIHWCUkqFan',
      'amount': 150,
      'name': 'Mocktaily.',
      'description': 'Tasty Drinks Near You',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
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
    print('Success Response: $response');
    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }
}
