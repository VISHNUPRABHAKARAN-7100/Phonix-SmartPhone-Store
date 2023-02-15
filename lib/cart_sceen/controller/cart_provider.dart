import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/view/home_screen.dart';
import 'package:phonix_smartphone_store/order/view/order_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'dart:developer';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartProvider with ChangeNotifier {
  paymetButton(context) {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_dy3pJlhra0l9NF',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR,
        (PaymentFailureResponse response) =>
            handlePaymentErrorResponse(response, context));
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS,
        (PaymentSuccessResponse response) =>
            handlePaymentSuccessResponse(response, context));
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response, context) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response, context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const OrderScreen(),
        ),
        (route) => false);
    
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    // showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
