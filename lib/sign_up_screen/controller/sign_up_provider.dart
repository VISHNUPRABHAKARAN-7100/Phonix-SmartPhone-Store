import 'package:flutter/cupertino.dart';

class SignUpProvider extends ChangeNotifier{

  // Textformfield variables.
  
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
}