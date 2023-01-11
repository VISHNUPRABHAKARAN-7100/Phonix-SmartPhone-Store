import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/otp_screen/controller/otp_provider.dart';
import 'package:phonix_smartphone_store/widgets/custome_button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This screen is for OTP verification
/// and user should provide the OTP
/// for creating a new account.
class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key, required this.mobileNumber}) : super(key: key);

  final focusNode = FocusNode();
  final formKeyForOTPVerification = GlobalKey<FormState>();
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      body: SafeArea(
        child: Center(
          child: Consumer<OTPProvider>(
            builder: (context, otpProviderValue, child) => Form(
              key: formKeyForOTPVerification,
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
                      controller: otpProviderValue.otpTextEditingController,
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
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomButton(
                          title: 'VERIFY',
                          ontap: () async {
                            if (formKeyForOTPVerification.currentState!
                                .validate()) {
                              otpProviderValue.varifyOTP(
                                  mobileNumber,
                                  otpProviderValue
                                      .otpTextEditingController.text,
                                  context);
                               
                            }
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            otpProviderValue.otpTextEditingController.clear();
                          },
                          child: const Text(
                            'Cancel',
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
      ),
    );
  }
}
