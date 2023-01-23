import 'dart:io';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/widgets/snackbar/snackbar.dart';

Future<bool> checkInternetConnection(BuildContext context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      SnackBarPopUp.popUp(
        context: context,
        text: 'No Internet Connection',
        color: Colors.red,
      );

      return false;
    }
  } on SocketException catch (_) {
    SnackBarPopUp.popUp(
      context: context,
      text: 'No Internet Connection',
      color: Colors.red,
    );

    return false;
  }
}
