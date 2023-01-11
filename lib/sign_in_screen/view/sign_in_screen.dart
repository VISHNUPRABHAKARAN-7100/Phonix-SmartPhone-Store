import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/sign_up_screen/view/sign_up_screen.dart';
import 'package:provider/provider.dart';
import '../../widgets/custome_button.dart';
import '../controller/sign_in_provider.dart';

/// This screen is for user login
/// If the user have already an account
/// on our application then user can sign in
/// and if the user has no account then
/// user can create a new account using the
/// sign up button.
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                      'Welcome,',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Glad to see you!',
                      style: GoogleFonts.anybody(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height * .1,
              ),
              // Form for the validation of mobile number and password
              // the user should enter mobile number and password
              // The length of the mobile number should be 10 and
              // length of the password should be 8.
              Consumer<SignInProvider>(
                builder: (context, signInProviderValue, child) => Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      // Textformfield for provide the mobile number.
                      TextFormField(
                        controller: signInProviderValue.mobileNumberController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
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
                          labelText: 'Phone Number',
                          focusColor: Colors.black,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.length < 10) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Consumer<SignInProvider>(
                        builder: (context, signInProviderValue, child) =>
                            // Textformfield fo password.
                            TextFormField(
                          controller: signInProviderValue.passwordController,
                          obscureText: signInProviderValue.passwordVisibility,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  signInProviderValue.setPasswordVisibility(),
                              icon: signInProviderValue.passwordVisibility
                                  ? const Icon(EvaIcons.eyeOff)
                                  : const Icon(EvaIcons.eye),
                            ),
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
                            if (value == null || value.length < 7) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Button for reset the password.
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Forgot your password?'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Reset here',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Button for sign in after filling the
              // username and password fields
              Consumer<SignInProvider>(
                builder: (context, signInProviderValue, child) => CustomButton(
                  title: 'SIGN IN',
                  ontap: () {
                    if (formGlobalKey.currentState!.validate()) {
                      signInProviderValue.signIn(
                        signInProviderValue.mobileNumberController.text,
                        signInProviderValue.passwordController.text,
                        context,
                      );
                    }
                  },
                ),
              ),
              // If the user has no account, then user can create
              // a new account by clicking the "Sign In " button.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
