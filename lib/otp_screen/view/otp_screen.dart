import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/otp_screen/controller/otp_provider.dart';
import 'package:phonix_smartphone_store/widgets/custome_button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
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
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomButton(
                          title: 'VERIFY',
                          ontap: () {
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
                          onPressed: () => Navigator.of(context).pop(),
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
