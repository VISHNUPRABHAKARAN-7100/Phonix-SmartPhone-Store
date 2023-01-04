import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/widgets/custome_button.dart';
import 'package:pinput/pinput.dart';

/// This screen is for OTP verification
/// and user should provide the OTP
/// for creating a new account.
class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key);

  final otpTextEditingController = TextEditingController();
  final focusNode = FocusNode();
  final formKeyForOtpVerification = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKeyForOtpVerification,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    controller: otpTextEditingController,
                    defaultPinTheme: PinTheme(
                      width: 65,
                      height: 65,
                      textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 4, 26, 45),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: const Color.fromARGB(102, 167, 226, 215),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return 'Enter a valid OTP';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomButton(
                        title: 'VARIFY',
                        ontap: () {
                          if (formKeyForOtpVerification.currentState!
                              .validate()) {
                            print(otpTextEditingController.text.toString());
                          }
                        },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resend?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}