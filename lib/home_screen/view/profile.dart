import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Profile',
            style: GoogleFonts.ubuntu(fontSize: size.height * .035),
          ),
        ),
        ListTile(
          leading: Text(
            'Addresses',
            style: TextStyle(fontSize: size.height * .025),
          ),
        ),
      ],
    ));
  }
}
