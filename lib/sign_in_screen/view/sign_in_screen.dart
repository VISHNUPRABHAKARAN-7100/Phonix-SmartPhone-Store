import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/sign_in_screen/controller/sign_in_controller.dart';
import 'package:provider/provider.dart';
import '../../home_screen/view/home_screen.dart';
import '../../widgets/custome_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'PHONIX',
            style: GoogleFonts.koulen(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 248, 250, 250)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            const Text(
              'Log in for the best experience',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Enter your phone number to continue',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formGlobalKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: phoneNumberController,
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
                        TextFormField(
                      controller: passwordController,
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
            CustomButton(
              title: 'SIGN IN',
              ontap: () {
                if (formGlobalKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {},
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
    );
  }
}
