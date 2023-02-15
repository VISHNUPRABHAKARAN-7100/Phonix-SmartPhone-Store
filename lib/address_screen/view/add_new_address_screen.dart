import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/utils/constant_colors.dart';
import 'package:phonix_smartphone_store/widgets/button/custom_button.dart';
import 'package:phonix_smartphone_store/widgets/textformfield/custom_textformfield.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddress({super.key});

  final fullNameTextEditingController = TextEditingController();
  final phoneNumberTextEditingController = TextEditingController();
  final pincodeTextEditingController = TextEditingController();
  final houseNumberTextEditingController = TextEditingController();
  final areaTextEditingController = TextEditingController();

  final addressFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantColors.appBackgroundColor,
        iconTheme: const IconThemeData(),
        title: Text(
          'PHONIX',
          style: GoogleFonts.ubuntu(
              color: ConstantColors.constantBlackColor,
              fontSize: size.height * 0.035),
        ),
        centerTitle: true,
      ),
      backgroundColor: ConstantColors.appBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Address',
              style: TextStyle(fontSize: size.width * 0.06),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Form(
              key: addressFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    inputFormats: [
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                      LengthLimitingTextInputFormatter(20)
                    ],
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    textEditingController: fullNameTextEditingController,
                    labelText: 'Full Name',
                    ontap: () {
                      if (fullNameTextEditingController.text.isEmpty) {
                        return 'Name required';
                      } else if (fullNameTextEditingController.text.length <
                          6) {
                        return 'Full Name should be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFormField(
                    inputFormats: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textEditingController: phoneNumberTextEditingController,
                    labelText: 'Phone Number',
                    ontap: () {
                      if (phoneNumberTextEditingController.text.isEmpty) {
                        return 'Phone Number is required';
                      } else if (phoneNumberTextEditingController.text.length <
                          10) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    inputFormats: [
                      LengthLimitingTextInputFormatter(6),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    textEditingController: pincodeTextEditingController,
                    labelText: 'Pincode',
                    ontap: () {
                      if (pincodeTextEditingController.text.isEmpty) {
                        return 'Pincode is required';
                      } else if (pincodeTextEditingController.text.length < 6) {
                        return 'Enter a valid Pincode';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    inputFormats: [
                      LengthLimitingTextInputFormatter(30),
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                    ],
                    textEditingController: houseNumberTextEditingController,
                    labelText: 'House Number',
                    ontap: () {
                      if (houseNumberTextEditingController.text.isEmpty) {
                        return 'House number required';
                      } else if (houseNumberTextEditingController.text.length <
                          6) {
                        return 'Enter a valid details';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    textEditingController: areaTextEditingController,
                    labelText: 'Area details',
                    ontap: () {
                      if (areaTextEditingController.text.isEmpty) {
                        return 'Details required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              title: 'Add address',
              ontap: () {
                if (addressFormKey.currentState!.validate()) {
                  log('Success');
                }
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
