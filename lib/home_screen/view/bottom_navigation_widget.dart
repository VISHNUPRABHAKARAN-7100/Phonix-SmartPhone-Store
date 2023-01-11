import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height * .03),
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(EvaIcons.homeOutline, size: 30),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.user),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.heart),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(EvaIcons.shoppingCartOutline, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
