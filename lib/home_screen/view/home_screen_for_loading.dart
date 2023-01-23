import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
import 'package:phonix_smartphone_store/home_screen/view/shimmer_widget.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class HomeScreenForLoading extends StatelessWidget {
  const HomeScreenForLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: ListView(
        children: [
          Provider.of<HomeScreenProvider>(
                    context,
                  ).isShimmerOfBanner ==
                  false
              ? const ShimmerWidget()
              : const HomeScreen()
        ],
      ),
    );
  }
}


