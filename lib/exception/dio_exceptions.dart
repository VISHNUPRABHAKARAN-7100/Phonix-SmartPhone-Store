import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/widgets/snackbar/snackbar.dart';

class DioExceptions {
  void dioError(Object e, BuildContext context) {
    if (e is DioError) {
      if (e is SocketException) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'OOPS... No Internet',
          color: Colors.red,
        );
      }else if (e is TimeoutException) {
      SnackBarPopUp.popUp(
          context: context,
          text: 'Connection Timedout',
          color: Colors.red,
        );
    }
    }
  }
}
