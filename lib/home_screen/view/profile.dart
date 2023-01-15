import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../sign_in_screen/view/sign_in_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
            'Profile',
            style: GoogleFonts.ubuntu(fontSize: size.height * .035),
          ),
          Divider(thickness: size.width*0.005,),
          ProfileTitleWidget(
            title: 'ADDRESS',
            onTap: () {},
          ),
          ProfileTitleWidget(
            title: 'LOG OUT',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text('haiii'),
                  content: const Text('Do you accept'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(FontAwesomeIcons.xmark),
                    ),
                    TextButton(
                      onPressed: () async {
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.remove('mobileNumber');
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: const Icon(FontAwesomeIcons.check),
                    ),
                  ],
                ),
              );
            },
          )
      ],
    ),
        ));
  }
}

class ProfileTitleWidget extends StatelessWidget {
  const ProfileTitleWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.06,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: size.height * .025),
            ),
            const Icon(FontAwesomeIcons.angleRight),
          ],
        ),
      ),
    );
  }
}
