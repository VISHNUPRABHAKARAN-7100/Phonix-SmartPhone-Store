import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/home_screen/view/home_screen.dart';
import 'package:phonix_smartphone_store/widgets/custome_button.dart';

/// This screen is for creating a new account
/// for user and user should provide the following
/// details and user will get a OTP and
/// user should validate the OTP . Then only
/// user can create a new account.
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final signUpFormGlobalKey = GlobalKey<FormState>();
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: size.height * .1,
              ),
              // Greating text
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Create account',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'to get started now',
                      style: GoogleFonts.anybody(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height * .1,
                    ),
                  ],
                ),
              ),
              // Form for validation the data.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: signUpFormGlobalKey,
                  child: Column(
                    children: [
                      // Textformfield for entering the name of the user.
                      TextFormField(
                        controller: nameEditingController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                        ],
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          labelText: 'Name',
                          focusColor: Colors.black,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Enter a valid name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Textformfield for entering the email address of the user.
                      TextFormField(
                        controller: emailEditingController,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          labelText: 'Email',
                          focusColor: Colors.black,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              value.length < 7 ||
                              !value.contains("@") ||
                              !value.contains('.') ||
                              !value.contains(".com")) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Textformfield for enter the password of the user.
                      TextFormField(
                        controller: passwordEditingController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          labelText: 'Password',
                          focusColor: Colors.black,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (passwordEditingController.text
                                  .toString()
                                  .trim() !=
                              confirmPasswordEditingController.text
                                  .toString()
                                  .trim()) {
                            return 'Password misssmatch';
                          } else if (value!.length < 6) {
                            return 'Password should be at least 6 characters';
                          } else if (value.isEmpty) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Textformfield for re-enter the password of the user.
                      TextFormField(
                        controller: confirmPasswordEditingController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          labelText: 'Confirm password',
                          focusColor: Colors.black,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (passwordEditingController.text
                                  .toString()
                                  .trim() !=
                              confirmPasswordEditingController.text
                                  .toString()
                                  .trim()) {
                            return 'Password misssmatch';
                          } else if (value!.length < 6) {
                            return 'Password should be at least 6 characters';
                          } else if (value.isEmpty) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Submit the form for creating a new account.
                      CustomButton(
                        title: 'SIGN UP',
                        ontap: () {
                          if (signUpFormGlobalKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
