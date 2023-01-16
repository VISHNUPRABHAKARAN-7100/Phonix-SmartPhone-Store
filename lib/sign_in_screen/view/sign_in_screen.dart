import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/sign_up_screen/view/sign_up_screen.dart';
import 'package:phonix_smartphone_store/utils/colors.dart';
import 'package:phonix_smartphone_store/widgets/custom_textformfield.dart';
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
      backgroundColor: ConstantColors.appBackgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantColors.appBackgroundcolor,
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
                      CustomTextFormField(
                        obscureText: false,
                        textEditingController:
                            signInProviderValue.mobileNumberController,
                        labelText: 'Phone Number',
                        ontap: () {
                          if (signInProviderValue
                                  .mobileNumberController.text.length <
                              10) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                        inputFormats: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                      ),

                      SizedBox(
                        height: size.height * .02,
                      ),
                      CustomTextFormField(
                        obscureText: signInProviderValue.passwordVisibility,
                        textEditingController:
                            signInProviderValue.passwordController,
                        suffixIconButton: IconButton(
                          onPressed: () =>
                              signInProviderValue.setPasswordVisibility(),
                          icon: signInProviderValue.passwordVisibility
                              ? const Icon(
                                  EvaIcons.eyeOff,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  EvaIcons.eye,
                                  color: Colors.black,
                                ),
                        ),
                        labelText: 'Password',
                        ontap: () {
                          if (signInProviderValue
                              .passwordController.text.isEmpty) {
                            return 'Password is required';
                          } else if (signInProviderValue
                                  .passwordController.text.length <
                              7) {
                            return 'Password should be at least 7 characters';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .02,
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
