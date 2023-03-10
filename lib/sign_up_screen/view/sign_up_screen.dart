import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/common/internet_connection.dart';
import 'package:phonix_smartphone_store/sign_up_screen/controller/sign_up_provider.dart';
import 'package:phonix_smartphone_store/sign_up_screen/model/sign_up_model.dart';
import 'package:phonix_smartphone_store/widgets/textformfield/custom_textformfield.dart';
import 'package:phonix_smartphone_store/widgets/button/custom_button.dart';
import 'package:provider/provider.dart';

import '../../utils/constant_colors.dart';
import '../services/sign_up_services.dart';

/// This screen is for creating a new account
/// for user and user should provide the following
/// details and user will get a OTP and
/// user should validate the OTP . Then only
/// user can create a new account.
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final signUpFormGlobalKey = GlobalKey<FormState>();

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
                      height: size.height * .05,
                    ),
                  ],
                ),
              ),
              // Form for validation the data.
              Consumer<SignUpProvider>(
                builder: (context, signUpProviderValue, child) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: signUpFormGlobalKey,
                    child: Column(
                      children: [
                        // Textformfield for entering the name of the user.
                        CustomTextFormField(
                          obscureText: false,
                          textEditingController:
                              signUpProviderValue.nameEditingController,
                          labelText: 'Name',
                          ontap: () {
                            if (signUpProviderValue
                                .nameEditingController.text.isEmpty) {
                              return 'Name is required';
                            } else if (signUpProviderValue
                                    .nameEditingController.text.length <
                                6) {
                              return 'Name should be at least 6 characters';
                            }
                            return null;
                          },
                          inputFormats: [
                            LengthLimitingTextInputFormatter(20),
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z ]")),
                          ],
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        // Textformfield for entering the phone number of the user.
                        CustomTextFormField(
                          obscureText: false,
                          textEditingController:
                              signUpProviderValue.mobileNumberEditingController,
                          labelText: 'Phone Number',
                          ontap: () {
                            if (signUpProviderValue
                                .mobileNumberEditingController.text.isEmpty) {
                              return 'Phone number is required';
                            } else if (signUpProviderValue
                                    .mobileNumberEditingController.text.length <
                                10) {
                              return 'Please enter a valid phone number';
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
                        // Textformfield for entering the email address of the user.
                        TextFormField(
                          controller:
                              signUpProviderValue.emailEditingController,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: ConstantColors.constantBlackColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: ConstantColors.constantBlackColor,
                              ),
                            ),
                            labelText: 'Email',
                            focusColor: ConstantColors.constantBlackColor,
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            } else if (value.isEmpty ||
                                value.length < 7 ||
                                !value.contains("@") ||
                                !value.contains('.') ||
                                !value.contains(".com")) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        // Textformfield for enter the password of the user.
                        CustomTextFormField(
                          obscureText: signUpProviderValue.isPasswordVisible,
                          textEditingController:
                              signUpProviderValue.passwordEditingController,
                          labelText: 'Password',
                          ontap: () {
                            if (signUpProviderValue
                                .passwordEditingController.text.isEmpty) {
                              return 'Password is required';
                            } else if (signUpProviderValue
                                    .passwordEditingController.text.length <
                                6) {
                              return 'Password should be at least 6 characters';
                            } else if (signUpProviderValue
                                    .passwordEditingController.text
                                    .toString()
                                    .trim() !=
                                signUpProviderValue
                                    .confirmPasswordEditingController.text
                                    .toString()
                                    .trim()) {
                              return 'Password missmatch';
                            }
                            return null;
                          },
                          inputFormats: [
                            LengthLimitingTextInputFormatter(15),
                          ],
                          suffixIconButton: IconButton(
                            onPressed: () =>
                                signUpProviderValue.changePasswordVisibility(),
                            icon: signUpProviderValue.isPasswordVisible
                                ? const Icon(
                                    EvaIcons.eyeOff,
                                    color: ConstantColors.constantBlackColor,
                                  )
                                : const Icon(
                                    EvaIcons.eye,
                                    color: ConstantColors.constantBlackColor,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        // Textformfield for re-enter the password of the user.
                        CustomTextFormField(
                          obscureText:
                              signUpProviderValue.isConfirmPasswordVisible,
                          textEditingController: signUpProviderValue
                              .confirmPasswordEditingController,
                          labelText: 'Confirm password',
                          ontap: () {
                            if (signUpProviderValue
                                .passwordEditingController.text.isEmpty) {
                              return 'Password is required';
                            } else if (signUpProviderValue
                                    .passwordEditingController.text.length <
                                6) {
                              return 'Password should be at least 6 characters';
                            } else if (signUpProviderValue
                                    .passwordEditingController.text
                                    .toString()
                                    .trim() !=
                                signUpProviderValue
                                    .confirmPasswordEditingController.text
                                    .toString()
                                    .trim()) {
                              return 'Password missmatch';
                            }
                            return null;
                          },
                          inputFormats: [
                            LengthLimitingTextInputFormatter(15),
                          ],
                          suffixIconButton: IconButton(
                            onPressed: () => signUpProviderValue
                                .changeConfirmPasswordVisibility(),
                            icon: signUpProviderValue.isConfirmPasswordVisible
                                ? const Icon(
                                    EvaIcons.eyeOff,
                                    color: ConstantColors.constantBlackColor,
                                  )
                                : const Icon(
                                    EvaIcons.eye,
                                    color: ConstantColors.constantBlackColor,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        // Submit the form for creating a new account.
                        CustomButton(
                          title: 'SIGN UP',
                          ontap: () async {
                            if (signUpFormGlobalKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              checkInternetConnection(context);
                              final signupModel = SignUpModel(
                                name: signUpProviderValue
                                    .nameEditingController.text,
                                mobileNumber: int.parse(signUpProviderValue
                                    .mobileNumberEditingController.text),
                                email: signUpProviderValue
                                    .emailEditingController.text,
                                password: signUpProviderValue
                                    .passwordEditingController.text,
                              );
                              SignUpServices.sendOtp(
                                signupModel,
                                context,
                                signUpProviderValue
                                    .mobileNumberEditingController.text,
                              );
                            }
                          },
                          // isLoading: signUpProviderValue.showLoader,
                        ),
                        // Navigation button to sign in page
                        // if the user clicked the sign up button
                        // accidentally and wants to go back to the sign in page.
                        SizedBox(
                          height: size.height * .1,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                style: TextStyle(
                                    color: ConstantColors.constantBlackColor),
                                text: 'Already have an account?',
                              ),
                              const WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 8),
                              ),
                              TextSpan(
                                text: 'Login',
                                style: const TextStyle(
                                  color: ConstantColors.constantBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => signUpProviderValue
                                      .cancelButtonFunction(context),
                              )
                            ],
                            style: const TextStyle(
                                color: ConstantColors.constantBlackColor),
                          ),
                        ),
                      ],
                    ),
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
