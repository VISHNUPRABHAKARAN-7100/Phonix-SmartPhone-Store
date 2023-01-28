import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';
import 'package:phonix_smartphone_store/widgets/snackbar/snackbar.dart';

class DioExceptions {
  void dioError(Object e, BuildContext context) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'User already exists...',
          color: ConstantColors.constantRedColor,
        );
      }
      if (e.response?.statusCode == 403) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'Invalid password',
          color: ConstantColors.constantRedColor,
        );
      }

      if (e is SocketException) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'OOPS... No Internet',
          color: Colors.red,
        );
      } else if (e is TimeoutException) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'Connection Timedout',
          color: Colors.red,
        );
      }
    }
  }
}
