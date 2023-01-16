import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/home_screen/controller/profile_provider.dart';
import 'package:provider/provider.dart';

// This screen is for showing the profile screen.

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: GoogleFonts.ubuntu(fontSize: size.height * .035),
          ),
          Divider(
            thickness: size.width * 0.005,
          ),
          ProfileTitleWidget(
            title: 'ADDRESS',
            onTap: () {},
          ),
          ProfileTitleWidget(
            title: 'LOG OUT',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Do you want to Log Out?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'NO',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Provider.of<ProfileProvider>(context, listen: false)
                            .logOutFunction(context);
                      },
                      child: const Text(
                        'YES',
                        style: TextStyle(color: Colors.black),
                      ),
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
