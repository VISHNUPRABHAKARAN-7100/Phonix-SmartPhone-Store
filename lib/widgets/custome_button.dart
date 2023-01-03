import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      required this.ontap,
      this.colorOfButton = Colors.white,
      this.backgroundColorOfButton = Colors.black})
      : super(key: key);

  final String title;
  final Function() ontap;
  final Color colorOfButton;
  final Color backgroundColorOfButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: backgroundColorOfButton,
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.urbanist(
              color: colorOfButton,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
