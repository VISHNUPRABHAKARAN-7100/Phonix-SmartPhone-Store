import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/home_screen/controller/profile_provider.dart';
import 'package:phonix_smartphone_store/home_screen/view/profile_title_widget.dart';
import 'package:phonix_smartphone_store/home_screen/view/terms_and_condition_screen.dart';
import 'package:provider/provider.dart';
import '../../utils/constant_colors.dart';

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
            title: 'Terms & Condition',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TermsAndCondition(),
              ),
            ),
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
                        style:
                            TextStyle(color: ConstantColors.constantBlackColor),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Provider.of<ProfileProvider>(context, listen: false)
                            .logOutFunction(context);
                      },
                      child: const Text(
                        'YES',
                        style:
                            TextStyle(color: ConstantColors.constantBlackColor),
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
